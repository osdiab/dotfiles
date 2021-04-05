(
  SCRIPT=$(realpath "$0")
  # Absolute path this script is in, thus /home/user/bin
  SCRIPTPATH=$(dirname "$SCRIPT")

  echo "~~~~~~~~~~~~~~~~~~~"
  echo "Installing packages"
  echo "~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/install.sh"
  echo "/n/n"

  echo "~~~~~~~~~~~~~~~~~~~~~"
  echo "Installing git config"
  echo "~~~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/git.sh"
  echo "/n/n"

  echo "~~~~~~~~~~~~~~~~~~~"
  echo "Installing zsh deps"
  echo "~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/zsh/install.sh"
  echo "/n/n"

  echo "~~~~~~~~~~~~~~~~~~~~~~"
  echo "Installing nvim config"
  echo "~~~~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/vim/install.sh"
  echo "/n/n"

  echo "~~~~~~~~~~~~~~~~~~~~~~"
  echo "Installing tmux config"
  echo "~~~~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/tmux/install.sh"
  echo "/n/n"

  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  echo "Installing alacritty config"
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  "$SCRIPTPATH/alacritty/install.sh"
  echo "/n/n"
)
