export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export ZSH_CONFIG="$HOME/.zsh-config"

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

#############################
# Language version managers #
#############################

# Setup pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper

eval "$(hub alias -s)"  # Alias hub as git
# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#########
# Version managers
#########

# Golang: Setup gvm
source "$HOME/.gvm/scripts/gvm"

# Node: Setup nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Ruby: Setup rvm
export PATH="$PATH:$HOME/.rvm/bin"

# Java: Setup jabba
[ -s "/Users/omar/.jabba/jabba.sh" ] && source "/Users/omar/.jabba/jabba.sh"

##########
# ZSH configuration
##########

# Import configs
source "$ZSH_CONFIG/public/osdiab/utilities.zsh"
# Personal configs, customize for yourself
source "$ZSH_CONFIG/personal/env-vars.zsh"
source "$ZSH_CONFIG/personal/project-helpers.zsh"

#####################
# Add stuff to path #
#####################

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=$PATH:$GOPATH/bin

