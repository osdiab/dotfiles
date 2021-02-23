# MacOSX: copy file to clipboard
alias clippy="pbcopy < "

# convert relative to absolute path
realpath () { case "$1" in /*)printf "%s\n" "$1";; *)printf "%s\n" "$PWD/$1";; esac; }

export ANDROID_HOME=${HOME}/Library/Android/sdk
alias adb=$ANDROID_HOME/platform-tools/adb
alias aapt=$ANDROID_HOME/build-tools/23.0.3/aapt
alias emulator=$ANDROID_HOME/emulator/emulator

autoload -U add-zsh-hook

# make https requests with httpie
alias https='http --default-scheme=https'

# In a folder full of git directories, call git pull on all of them.
pullall() {
  ls | xargs -P10 -I{} git -C {} pull
}

alias vim='nvim'

notif () {
  DEFAULT_TITLE="Terminal"
  osascript -e "display notification \"$1\" with title \"${2:-$DEFAULT_TITLE}\""
}
