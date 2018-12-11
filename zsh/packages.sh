(
	if ! [ -x "$(command -v brew)" ]; then
	  echo 'Error: Homebrew is not installed. Do that first.' >&2
	  exit 1
	fi

	echo ">> installing required packages"
	echo "- zsh: Replacement shell"
	echo "- antigen: Package manager for zsh"
	echo "- hub: Github's replacement git"
	echo "- pyenv: Python version manager"
	echo "- pyenv-virtualenv[wrapper]: scoped environments for Pyenv-installed Pythons"
	echo "- nvm: Node version manager"
	echo "- mercurial: Version control program, necessary for Go Version Manager (gvm)"
	echo "- httpie: Command line HTTP client, alternative to curl/Postman"
	brew install\
			zsh\
			antigen\
			hub\
			pyenv\
			pyenv-virtualenv\
			pyenv-virtualenvwrapper\
			nvm\
			mercurial\
			httpie

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Installing packages failed with code $retval"
		exit 1
	fi

	echo ">> installing Mac OS SDK headers for iOS 10.14 (Mojave)"
	sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "installing SDK headers failed with code $retval"
		exit 1
	fi

	echo ">> installing ruby version manager (rvm)\n"
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
	\curl -sSL https://get.rvm.io | bash -s stable

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "installing rvm failed with code $retval"
		exit 1
	fi

	echo ">> installing go version manager (gvm)"
	\curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "installing gvm failed with code $retval"
		exit 1
	fi

	echo ">> instaling jabba (java version manager)"
	\curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Installing jabba failed with code $retval"
		exit 1
	fi

	echo ">> installing chxcode (XCode version manager)"
	brew tap klaaspieter/formula

	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Tapping chxcode failed with code $retval"
		exit 1
	fi

	brew install chxcode
	retval=$?
	if [ $retval -ne 0 ]; then
		echo "Installing chxcode failed with code $retval"
		exit 1
	fi

	echo "done"
)
