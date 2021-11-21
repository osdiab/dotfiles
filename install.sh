echo "=================="
echo "Installing brew..."
echo "=================="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "====================="
echo "Installing Rosetta..."
echo "====================="
sudo softwareupdate --install-rosetta

echo "======================="
echo "Installing brew deps..."
echo "======================="
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# install casks
brew install\
	1password\
	google-chrome\
	obs\
	amethyst\
	google-cloud-sdk\
	obsidian\
	audio-hijack\
	google-drive\
	authy\
	qmk-toolbox\
	bartender\
	raycast\
	battle-net\
	kindle\
	rekordbox\
	kitty\
	krisp\
	signal\
	linear-linear\
	skype\
	deepl\
	logitech-camera-settings\
	slack\
	discord\
	soundsource\
	disk-inventory-x\
	spotify\
	stay\
	docker\
	loom\
	steam\
	loopback\
	teamviewer\
	the-unarchiver\
	farrago\
	transmission\
	figma\
	microsoft-teams\
	firefox\
	vlc\
	fission\
	xld\
	focusrite-control\
	native-access\
	zoom\
	font-input\
	ngrok\
	notion\
	anki\
	microsoft-excel\
	microsoft-powerpoint

brew install\
	antigen\
	asdf\
	dopplerhq/cli/doppler\
	ffmpeg\
	git\
	gnupg\
	hasura-cli\
	httpie\
	hub\
	imagemagick\
	jq\
	magic-wormhole\
	neovim\
	pwgen\
	ripgrep\
	rsync\
	watchman\
	yarn


echo "Also, open the link in divvy-shortcuts.txt to install Divvy config"

echo "\n\n"

# allow vscode to key-repeat
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

open /opt/homebrew/Caskroom/battle-net/latest/Battle.net-Setup.app

echo "\n\n"
echo "Plus, open the App Store and install any other missing apps."
