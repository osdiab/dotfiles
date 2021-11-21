#!/usr/bin/env bash

(
    echo ">> Installing vim-plug for Neovim"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    mkdir -p ~/.local/share/nvim/tmp
    mkdir -p ~/.local/share/nvim/backup
    NVIM_CONFIG_DIR="$HOME/.config/nvim"

    DIR="$( dirname "$( realpath "$0" )" )"
    ln -s "$DIR" "$NVIM_CONFIG_DIR"

    vim -c ":PlugInstall"
)
