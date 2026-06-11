eval $(/opt/homebrew/bin/brew shellenv)
export ZSH_CONFIG="$HOME/.config/zsh"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="clean"
plugins=(git)

source $ZSH/oh-my-zsh.sh

#############################
# Language version managers #
#############################

# ASDF: Setup asdf
. $(brew --prefix asdf)/libexec/asdf.sh
# make asdf-postgres work
export PKG_CONFIG_PATH="/opt/nanobrew/prefix/bin:$PATH/opt/homebrew/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

##############################
# External ZSH configuration #
##############################

# Import configs
source "$(dirname $0:A)/utilities.zsh"

alias vim='nvim'
