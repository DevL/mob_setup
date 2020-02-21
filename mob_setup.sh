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
echo "syntax on" > ~/.vimrc

# Install and configure git and hub
brew install git hub
touch ~/.gitignore
git config --global core.excludesfile `~/.gitignore`
git config --global push.default current
git config --global pull.rebase true
git config --global fetch.prune true
git config --global diff.compactionHeuristic true
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.unstage "reset HEAD --"
git config --global alias.ds "diff --staged"

# Set zsh to be the default shell and enable git tab completions
echo "Enable zsh and git tab completions"
chsh -s /bin/zsh
mkdir ~/.zsh
mkdir ~/.zsh/completions
cp /usr/local/share/zsh/site-functions/git-completion.bash ~/.zsh/completions/_hub
echo "fpath=(~/.zsh/completions $fpath)" > ~/.zshrc
echo "autoload -Uz compinit && compinit" > ~/.zshrc
echo "autoload bashcompinit && bashcompinit" > ~/.zshrc
echo "For further zsh configuration, see https://scriptingosx.com/2019/06/moving-to-zsh/"
open "https://scriptingosx.com/2019/06/moving-to-zsh/"

