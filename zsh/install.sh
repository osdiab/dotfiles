(
  SCRIPT=$(realpath "$0")
  # Absolute path this script is in, thus /home/user/bin
  SCRIPTPATH=$(dirname "$SCRIPT")

  ln -s $SCRIPTPATH "$HOME/.config/zsh"
  echo 'source "$HOME/.config/zsh/.zshrc"' > $HOME/.zshrc
)
