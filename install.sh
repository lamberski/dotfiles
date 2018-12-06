#!/bin/sh

echo "\033[4;33mGet latest version of dotfiles\033[0m"
git pull origin master

###############################################################################
# Homebrew
###############################################################################

homebrew="$HOME/.homebrew"

if [ ! -f "$homebrew/bin/brew" ]
then
  echo "\033[4;33mInstalling Homebrew\033[0m"
  git clone https://github.com/mxcl/homebrew.git $homebrew
else
  echo "\033[4;33mUpdating Homebrew and packages\033[0m"
  brew update
  brew upgrade
fi

echo "\033[4;33mInstalling Homebrew packages\033[0m"

# Install version control systems
brew install git
brew install node
brew install composer
brew install redis
brew install php@7.2
brew install mysql@5.7

###############################################################################
# Brew Cask
###############################################################################

brew tap caskroom/versions

brew cask install visual-studio-code
brew cask install transmit
brew cask install dropbox
brew cask install sequel-pro
brew cask install google-chrome
brew cask install unity
brew cask install transmission
brew cask install spotify
brew cask install postman
brew cask install gfxcardstatus
brew cask install hammerspoon
brew cask install backblaze
brew cask install appcleaner
brew cask install sublime-text
brew cask install soundcleod
brew cask install ledger-live
brew cask install firefox
brew cask install opera
brew cask install iina
brew cask install java8
brew cask install android-sdk

###############################################################################
# Composer
###############################################################################

composer global require "phpmd/phpmd"
composer global require "squizlabs/php_codesniffer"
composer global require "friendsofphp/php-cs-fixer"
composer global require "laravel/valet"
composer global require "laravel/installer"
composer global require "laravel/lumen-installer"
composer global require "phpunit/phpunit"
composer global require "deployer/deployer"

###############################################################################
# Node
###############################################################################

echo "\033[4;33mInstalling Node packages\033[0m"
npm install -g gulp
npm install -g sass-lint
npm install -g @vue/cli
npm install -g @vue/cli-init
npm install -g eslint
npm install -g frontkit
npm install -g nativescript

###############################################################################
# Install
###############################################################################

echo "\033[4;33mInstall dotfiles to ~\033[0m"

ln -s ~/Documents/Application\ Support/Sublime\ Text\ 3 ~/Library/Application\ Support/
ln -s ~/Documents/Application\ Support/Transmit ~/Library/Application\ Support/
ln -s ~/Documents/Application\ Support/Postman ~/Library/Application\ Support/
ln -s ~/Documents/Application\ Support/Sequel\ Pro ~/Library/Application\ Support/

rm -rf ~/.bash_profile
rm -rf ~/.bashrc
rm -rf ~/.extra
rm -rf ~/.profile
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
rm -rf ~/.zshrc
rm -rf ~/.vscode
rm -rf ~/.oh-my-zsh

ln -s ~/Documents/Dotfiles/.bash_profile ~
ln -s ~/Documents/Dotfiles/.bashrc ~
ln -s ~/Documents/Dotfiles/.extra ~
ln -s ~/Documents/Dotfiles/.profile ~
ln -s ~/Documents/Dotfiles/.gitconfig ~
ln -s ~/Documents/Dotfiles/.gitignore ~
ln -s ~/Documents/Dotfiles/.zshrc ~
ln -s ~/Documents/Dotfiles/.vscode ~
ln -s ~/Documents/Dotfiles/.oh-my-zsh ~

source ~/.profile
