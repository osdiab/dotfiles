echo "=================="
echo "Installing brew..."
echo "=================="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "======================="
echo "Installing brew deps..."
echo "======================="
brew tap klaaspieter/formula
brew tap heroku/brew
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# install casks
arch -arm64 brew install --cask
	1password\
	docker\
	keka\
	obs\
	stay\
	alfred\
	dupeguru\
	keybase\
	qmk-toolbox\
	steam\
	authy\
	firefox\
	kindle\
	rekordbox\
	teamviewer\
	kitty\
	sequel-ace\
	the-unarchiver\
	bartender\
	signal\
	transmission\
	battle-net\
	font-input\
	sketch\
	cyberghost-vpn\
	skype\
	visual-studio-code\
	deepl\
	google-chrome\
	logitech-options\
	slack\
	vlc\
	discord\
	handbrake\
	loom\
	xld\
	disk-inventory-x\
	imageoptim\
	minecraft\
	divvy\
	native-access\
	spotify

arch -arm64 brew install\
	antigen\
	asdf\
	cloudflare/cloudflare/cloudflared\
	gh\
	heroku/brew/heroku\
	httpie\
	hub\
	jq\
	klaaspieter/formula/chxcode\
	koekeishiya/formulae/skhd\
	koekeishiya/formulae/yabai\
	magic-wormhole\
	mercurial\
	mpv\
	neovim\
	postgis\
	python@3.8\
	redis\
	ripgrep\
	sd\
	tmux\
	watchman\
	yarn

echo "\n\n"

# allow vscode to key-repeat
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

open /opt/homebrew/Caskroom/battle-net/latest/Battle.net-Setup.app
open /opt/homebrew/Caskroom/backblaze/*/Backblaze\ Installer.app

echo "\n\n"
echo "Also, open the link in divvy-shortcuts.txt to install Divvy config"
echo "Plus, open the App Store and install any other missing apps."
