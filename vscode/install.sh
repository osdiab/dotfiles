(
  SCRIPT=$(realpath "$0")
  # Absolute path this script is in, thus /home/user/bin
  SCRIPTPATH=$(dirname "$SCRIPT")

  ln -s "$SCRIPTPATH/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
)
