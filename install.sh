echo "=================="
echo "Installing brew..."
echo "=================="
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install casks

echo "==================="
echo "Installing casks..."
echo "==================="
brew cask install\
	1password\
	disk-inventory-x\
	keka\
	obs\
	steam\
	alfred\
	divvy\
	keybase\
	rekordbox\
	teamviewer\
	anki\
	docker\
	kindle\
	signal\
	the-unarchiver\
	backblaze\
	dupeguru\
	kitty\
	sketch\
	transmission\
	bartender\
	firefox\
	krisp\
	skype\
	visual-studio-code\
	battle-net\
	font-input\
	little-snitch\
	slack\
	vlc\
	cyberghost-vpn\
	google-chrome\
	loom\
	soundflower\
	xld\
	deepl\
	handbrake\
	minecraft\
	soundflowerbed\
	zulip\
	discord\
	imageoptim\
	native-access\
	spotify

echo "\n\n"

echo "======================="
echo "Installing cli tools..."
echo "======================="
brew tap klaaspieter/formula
brew tap heroku/brew

brew install\
	hub\
	httpie\
	ripgrep\
	nvim\
	postgres\
	coreutils\
	antigen\
	pyenv\
	pyenv-virtualenv\
	pyenv-virtualenvwrapper\
	nvm\
	mercurial\
	httpie\
	jq\
	jabba\
	chxcode\
	heroku

echo "\n\n"

echo "=================="
echo "Installing yarn..."
echo "=================="
curl -o- -L https://yarnpkg.com/install.sh | bash

echo "\n\n"

echo "================="
echo "Installing rvm..."
echo "================="
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash

echo "\n\n"

echo "================="
echo "Installing gvm..."
echo "================="
\curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer

echo "\n\n"

echo "Run the following commands afterwards:"
echo "$ open /usr/local/Caskroom/battle-net/latest/Battle.net-Setup.app"
echo "$ open /usr/local/Caskroom/little-snitch/4.5.2/LittleSnitch-4.5.2.dmg"

echo "\n\n"
echo "Also, open the link in divvy-shortcuts.txt to install Divvy config"
echo "Plus, open the App Store and install any other missing apps."
