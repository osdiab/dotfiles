#!/usr/bin/env bash

(
    echo ">> Installing MacVim"
    brew install macvim

    echo ">> Installing Neovim"
    brew install nvim

    echo ">> Installing vim-plug for vim"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo ">> Installing vim-plug for Neovim"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    mkdir -p ~/.vim/tmp
    mkdir -p ~/.vim/backup
    mkdir -p ~/.local/share/nvim/tmp
    mkdir -p ~/.local/share/nvim/backup
    NVIM_CONFIG_DIR="$HOME/.config/nvim"
    mkdir -p $NVIM_CONFIG_DIR

    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    ln -s "$DIR/.vimrc" "$NVIM_CONFIG_DIR/init.vim"
    ln -s "$DIR/plugins.vim" "$NVIM_CONFIG_DIR/plugins.vim"
    ln -s "$DIR/.vimrc" "$HOME/.vimrc"
)
