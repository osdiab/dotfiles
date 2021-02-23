echo "=================="
echo "Installing brew..."
echo "=================="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install casks

echo "==================="
echo "Installing casks..."
echo "==================="
brew install --cask\
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
	teamviewer
	backblaze\
	kitty\
	sequel-ace\
	the-unarchiver
	bartender\
	signal\
	transmission\
	battle-net\
	font-input\
	sketch\
	cyberghost-vpn\
	skype\
	visual-studio-code
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

echo "\n\n"

echo "======================="
echo "Installing cli tools..."
echo "======================="
brew tap klaaspieter/formula
brew tap heroku/brew

brew install\
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
	watchman\
	yarn

echo "\n\n"

echo "Run the following commands afterwards:"
echo "$ open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app"
echo "$ open /usr/local/Caskroom/backblaze/7.0.1.452/Backblaze Installer.app"

echo "\n\n"
echo "Also, open the link in divvy-shortcuts.txt to install Divvy config"
echo "Plus, open the App Store and install any other missing apps."
