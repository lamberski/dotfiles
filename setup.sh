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
brew install subversion
brew install homebrew/php/php70
brew install node

# Remove outdated versions from the cellar
brew cleanup

###############################################################################
# Composer
###############################################################################

composer global require "phpmd/phpmd"
composer global require "squizlabs/php_codesniffer"
composer global require "deployer/deployer"
composer global require "laravel/homestead"
composer global require "wp-cli/wp-cli"

###############################################################################
# Node
###############################################################################

echo "\033[4;33mClean NPM cache\033[0m"
npm cache clean

echo "\033[4;33mInstalling Node packages\033[0m"
npm install -g bower
npm install -g grunt
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g generator-xh
npm install -g sass-lint
npm install -g jshint
npm install -g vue-cli

echo "\033[4;33mUpdating global Node packages\033[0m"
npm update -g

###############################################################################
# Install
###############################################################################

echo "\033[4;33mCopy dotfiles to ~\033[0m"
rsync --exclude ".git/" \
      --exclude "setup.sh" \
      --exclude "README.md" \
      --exclude "npm-debug.log" \
      -avh --no-perms . ~;

source ~/.profile
