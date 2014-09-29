#!/bin/sh

echo "\033[4;33mGet latest version of dotfiles\033[0m"
git pull origin master

###############################################################################
# Homebrew                                                                    #
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

echo "\033[4;33mInstalling Homebrew taps and packages\033[0m"

# Re-add taps
brew untap homebrew/versions
brew tap homebrew/versions
brew untap homebrew/dupes
brew tap homebrew/dupes
brew untap homebrew/php
brew tap homebrew/php

# Install libraries & SDKs
brew install android-sdk
brew install android-ndk

# Install version control systems
brew install git
brew install subversion

# Install database systems
brew install mysql
ln -sfv $homebrew/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
brew install postgresql
ln -sfv $homebrew/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Install web server stuff
brew install homebrew/php/php56 --with-intl --with-pgsql
ln -sfv $homebrew/opt/php56/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
brew install homebrew/php/composer

# Install other stuff
brew install node
brew install ant
brew install ffmpeg
brew install tree

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
gem install jekyll

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
