(
  SCRIPT=$(realpath "$0")
  # Absolute path this script is in, thus /home/user/bin
  SCRIPTPATH=$(dirname "$SCRIPT")

  ln -s $SCRIPTPATH "$HOME/.config/kitty"

  mkdir -p "$HOME/code/open-source"
  git clone --depth 1 git@github.com:dexpota/kitty-themes.git "$HOME/code/open-source/kitty-themes"
  ln -s "$HOME/code/open-source/kitty-themes/themes/Monokai_Pro.conf" "$HOME/.config/kitty/theme.conf"
)
