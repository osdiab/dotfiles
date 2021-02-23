eval $(/opt/homebrew/bin/brew shellenv)
export ZSH_CONFIG="$HOME/.config/zsh"

#############
# Zsh setup #
#############

# Install antigen first. `brew install antigen`
source /usr/local/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen theme oskarkrawczyk/honukai-iterm-zsh honukai
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# up and down arrow history behavior
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

eval "$(hub alias -s)"  # Alias hub as git

# alt + arrows jumps words
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

#############################
# Language package managers #
#############################

# Setup JS
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Setup rust
export PATH="$HOME/.cargo/bin:$PATH"

# Setup Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Setup go
export PATH=$PATH:$GOPATH/bin

# Setup postgres
export PATH=$PATH:/usr/local/opt/libpq/bin

# Setup VSCode
export PATH=$PATH:"/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"

#############################
# Language version managers #
#############################

# ASDF: Setup asdf
. $(brew --prefix asdf)/asdf.sh

##############################
# External ZSH configuration #
##############################

# Import configs
source "$(dirname $0:A)/utilities.zsh"
source "$ZSH_CONFIG/personal.zsh"

