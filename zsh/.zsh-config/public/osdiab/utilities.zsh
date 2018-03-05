function trim() {
    local var=$@
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

# MacOSX: copy file to clipboard
alias clippy="pbcopy < "

# convert relative to absolute path
realpath () { case "$1" in /*)printf "%s\n" "$1";; *)printf "%s\n" "$PWD/$1";; esac; }

alias adb=$HOME/Library/Android/sdk/platform-tools/adb
alias aapt=$HOME/Library/Android/sdk/build-tools/23.0.3/aapt

# find nearest matching filename recursively up directory
find-up () {
  cur_path=$(pwd)
  while [[ "$cur_path" != "" && ! -e "$cur_path/$1" ]]; do
    cur_path=${cur_path%/*}
  done
  echo "$cur_path"
}

autoload -U add-zsh-hook

# Automatically load node_modules to path upon entering directory
add-node-modules-to-path() {
  if [ "$(find-up package.json)" != "" ]; then
    new_bin=$(npm bin)
    if [ "$NODE_MODULES_PATH" != "$new_bin" ]; then
      export PATH=${PATH%:$NODE_MODULES_PATH}:$new_bin
      export NODE_MODULES_PATH=$new_bin
    fi
  else
    if [ "$NODE_MODULES_PATH" != "" ]; then
      export PATH=${PATH%:$NODE_MODULES_PATH}
      export NODE_MODULES_PATH=""
    fi
  fi
}
add-zsh-hook chpwd add-node-modules-to-path

# Automatically use correct node version based on nvmrc, or package.json engine
# version.
# TODO: make it work with fuzzy versions, not just exact ones
# Requires nvm. `brew install nvm`
load-nvmrc() {
  # check for .nvmrc file
  local nvmrc_path="$(find-up .nvmrc)"
  if [ "$nvmrc_path" != "" ]; then
    # found nvmrc, use it
    local found_nvm_type=".nvmrc"
    local found_nvm_source_dir=$nvmrc_path
    local found_node_version="$(cat $nvmrc_path/.nvmrc)"
  else
    # get npm version from package.json's engines.node entry
    # this gives preference to .nvmrc
    local package_json_path="$(find-up package.json)"
    if [ "$package_json_path" != "" ]; then
      local package_node_version="$(cat "$package_json_path/package.json" | jq '.engines.node')"
      if [ "$package_node_version" != "null" ]; then
        local found_nvm_type="package.json"
        local found_nvm_source_dir=$package_json_path
        local found_node_version="${${package_node_version#\"}%\"}" # strip quotes
      fi
    fi
  fi

  # if node version present, use it
  if [ -z ${found_nvm_type+x} ]; then
    # no nvm found, go back to default if necessary
    if [ "$CUR_NVMRC" != "" ]; then
      echo "exited source directory, reverting to default node version..."
      export CUR_NVMRC=""
      nvm use default
    fi
  else
    # if found a new node version source, use the new one
    if [ "$CUR_NVMRC" != "$found_nvm_source_dir" ]; then
      echo "Found node version from $found_nvm_type, using version $found_node_version..."
      export CUR_NVMRC="$found_nvm_source_dir"
      nvm use "$found_node_version"
    fi
    # otherwise keep using the current one
  fi
}
add-zsh-hook chpwd load-nvmrc

# make https requests with httpie
alias https='http --default-scheme=https'

# vscode shortcut
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# In a folder full of git directories, call git pull on all of them.
pullall() {
  ls | xargs -P10 -I{} git -C {} pull
}

