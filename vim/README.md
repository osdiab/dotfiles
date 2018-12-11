# Vim

Sets up both MacVim and Neovim.

* Ensure `~/.vimrc` and `~/.config/nvim/init.vim` don't exist.
* When you start either vim or NeoVim, type `:PlugInstall` and hit enter to install all plugins.
* If you want to replace `vim` with MacVim, add this to your `.zshrc` or `.bashrc`
  * `alias vim='mvim -v'`
* For the same for NeoVim
  * `alias vim='nvim'`

