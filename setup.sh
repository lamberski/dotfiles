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

  echo "\033[4;33mInstalling Homebrew taps\033[0m"
  brew tap homebrew/versions
  brew tap homebrew/dupes
  brew tap homebrew/php
  brew tap homebrew/services
else
  echo "\033[4;33mUpdating Homebrew and packages\033[0m"
  brew update
  brew upgrade
fi

echo "\033[4;33mInstalling Homebrew packages\033[0m"

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
brew install homebrew/apache/httpd24
ln -sfv $homebrew/opt/httpd24/*.plist ~/Library/LaunchAgents
brew install homebrew/php/php56 --with-intl --with-pgsql
ln -sfv $homebrew/opt/php56/*.plist ~/Library/LaunchAgents
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
brew install homebrew/php/composer
brew install homebrew/php/wp-cli
brew install homebrew/php/drush

# Install other stuff
brew install node
brew install ffmpeg
brew install tree
brew install imagemagick
brew install graphicsmagick

# Remove outdated versions from the cellar
brew cleanup

###############################################################################
# RVM                                                                         #
###############################################################################

echo "\033[4;33mInstalling RVM\033[0m"
curl -L https://get.rvm.io | bash

echo "\033[4;33mInstalling Ruby with RVM\033[0m"
rvm install 2.2.1
rvm use 2.2.1 --default

echo "\033[4;33mInstalling gems\033[0m"
gem install bundler
gem install capistrano
gem install sass

###############################################################################
# Node                                                                        #
###############################################################################

echo "\033[4;33mClean NPM cache\033[0m"
npm cache clean

echo "\033[4;33mInstalling Node packages\033[0m"
npm install -g bower
npm install -g grunt
npm install -g grunt-cli
npm install -g gulp
npm install -g yo

echo "\033[4;33mUpdating global Node packages\033[0m"
npm update -g

###############################################################################
# Install                                                                     #
###############################################################################

echo "\033[4;33mCopy dotfiles to ~\033[0m"
rsync --exclude ".git/" \
      --exclude "setup.sh" \
      --exclude "README.md" \
      --exclude "npm-debug.log" \
      -avh --no-perms . ~;

source ~/.profile
