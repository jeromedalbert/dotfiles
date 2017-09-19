# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew install caskroom/cask/brew-cask

brew tap homebrew/dupes
brew tap universal-ctags/universal-ctags

cat ~/.scripts/.brew_list | xargs brew install --with-default-names
cat ~/.scripts/.brew_cask_list | xargs brew cask install
