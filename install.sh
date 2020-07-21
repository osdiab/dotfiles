# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install casks

brew cask install docker kitty visual-studio-code little-snitch google-chrome bartender firefox alfred loom native-access rekordbox 1password

# install cli tools
brew tap klaaspieter/formula

brew install\
	hub\
	httpie\
	ripgrep\
	nvim\
	coreutils \
	antigen\
	pyenv\
	pyenv-virtualenv\
	pyenv-virtualenvwrapper\
	nvm\
	mercurial\
	httpie\
	jq\
	jabba\
	chxcode

curl -o- -L https://yarnpkg.com/install.sh | bash
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
\curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer
