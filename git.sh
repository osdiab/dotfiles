if [ ! -f "$HOME/.ssh/id_rsa" ]; then
  echo "================"
  echo "Creating SSH key"
  echo "================"
  ssh-keygen
  echo "\n\n"
fi

echo "==========================="
echo "Adding SSH keys to keychain"
echo "==========================="

ssh-add -K

echo "\n\n"

echo "==============="
echo "Configuring git"
echo "==============="

# Git
git config --global credential.helper osxkeychain
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global alias.pushup 'push -u origin HEAD'
git config --global alias.newbranch 'checkout -b'
git config --global --edit
# End git

