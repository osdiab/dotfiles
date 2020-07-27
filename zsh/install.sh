(
  SCRIPT=$(realpath "$0")
  # Absolute path this script is in
  SCRIPTPATH=$(dirname "$SCRIPT")

  # this path might change in newer versions of Mac OSX
  ln -s\
    "$HOME/Library/Mobile Documents/com~apple~CloudDocs/config/zsh/personal.zsh"\
    "$HOME/.config/zsh/personal.zsh"
  ln -s $SCRIPTPATH "$HOME/.config/zsh"
  echo 'source "$HOME/.config/zsh/.zshrc"' > $HOME/.zshrc

  echo 'Please ensure personal iCloud is synced.'
)
