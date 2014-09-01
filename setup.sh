#!/bin/sh

echo "\033[4;33mGet latest version of dotfiles\033[0m"
git pull origin master

###############################################################################
# Homebrew                                                                    #
###############################################################################

echo "\033[4;33mInstalling Homebrew\033[0m"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

echo "\033[4;33mInstalling Homebrew packages\033[0m"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Add taps
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/php

# Install libraries & SDKs
brew install android-sdk
brew install android-ndk

# Install version control systems
brew install git
brew install subversion

# Install database systems
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

# Install web server stuff
brew install homebrew/php/php55 --with-intl --with-pgsql
brew install homebrew/php/composer

# Install other stuff
brew install node
brew install ant
brew install ffmpeg

# Remove outdated versions from the cellar
brew cleanup

###############################################################################
# RVM                                                                         #
###############################################################################

echo "\033[4;33mInstalling RVM\033[0m"
curl -L https://get.rvm.io | bash

echo "\033[4;33mInstalling Ruby with RVM\033[0m"
rvm install 2.1.2
rvm use 2.1.2 --default

echo "\033[4;33mInstalling gems\033[0m"
gem install bundler
gem install dandelion

###############################################################################
# Node                                                                        #
###############################################################################

echo "\033[4;33mInstalling Node packages\033[0m"
npm install -g bower
npm install -g grunt
npm install -g yo

###############################################################################
# Install                                                                     #
###############################################################################

echo "\033[4;33mCopy dotfiles to ~\033[0m"
rsync --exclude ".git/" \
      --exclude "setup.sh" \
      --exclude "readme.md" \
      -avh --no-perms . ~;

source ~/.profile
