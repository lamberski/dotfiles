#!/bin/sh

echo "\033[4;33mUpdating global Homebrew packages\033[0m"
brew upgrade
brew cleanup

echo "\033[4;33mUpdating global Homebrew Cask apps\033[0m"
brew cask upgrade

echo "\033[4;33mUpdating global Composer packages\033[0m"
composer global update
composer global clear-cache

echo "\033[4;33mUpdating global Node packages\033[0m"
npm update -g
