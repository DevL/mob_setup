#!/usr/bin/env bash

# Exit on any failure
set -e

wait_for_user () {
  echo "Hit enter to continue"
  read
}

# XCode
echo "Install XCode CLI tools (see pop-up window for next steps)"
xcode-select --install
wait_for_user

# Homebrew
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# iTerm 2
echo "Installing iTerm 2"
brew cask install iterm2

# LastPass
echo "Installing LastPass"
brew cask install lastpass

# Mobster
echo "Installing Mobster"
brew cask install mobster

# Postman
echo "Installing Postman"
brew cask install postman

# Pycharm
echo "Installing Pycharm"
brew cask install pycharm

# Rectangle
echo "Installing Rectangle window manager"
brew cask install rectangle

# Slack
echo "Installing Slack"
brew cask install slack

# Sublime Text
echo "Installing Sublime Text 3"
brew cask install sublime-text

# Vim
echo "Enable syntax coloring in vim"
echo "syntax on" >> ~/.vimrc

# Install and configure git and hub
brew install git hub
touch ~/.gitignore
# git config --global core.excludesfile `~/.gitignore`
git config --global push.default current
git config --global pull.rebase true
git config --global fetch.prune true
git config --global diff.compactionHeuristic true
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.unstage "reset HEAD --"
git config --global alias.ds "diff --staged"

# Install Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set aliases
echo "Add zsh aliases"
echo "alias ll='ls -laF'" >> ~/.zshrc
echo "alias reloadprofile='source ~/.zshrc'" >> ~/.zshrc
