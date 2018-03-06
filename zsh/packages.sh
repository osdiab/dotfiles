echo ">> installing required packages"

brew install\
		zsh\
		antigen\
		hub\
		mercurial\
		pyenv\
		pyenv-virtualenv\
		pyenv-virtualenvwrapper\
		nvm\
		jabba\
		httpie

echo ">> installing ruby version manager (rvm)\n"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

echo ">> installing go version manager (gvm)"
\curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer

echo "done"
