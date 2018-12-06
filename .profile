###############################################################################
# Paths                                                                       #
###############################################################################

export PATH="$HOME/.homebrew/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export ANDROID_HOME=/usr/local/share/android-sdk
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

###############################################################################
# Aliases                                                                     #
###############################################################################

# Unlock/lock OS X Dock
alias docklock="defaults write com.apple.dock contents-immutable -bool true;killall Dock"
alias dockunlock="defaults write com.apple.dock contents-immutable -bool false;killall Dock"

# Dotfiles controls
alias dotinstall="source ~/Documents/Dotfiles/install.sh"
alias dotupdate="source ~/Documents/Dotfiles/update.sh"

# Other stuff
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

function code {
  if [[ $# = 0 ]]
  then
    open -a "Visual Studio Code"
  else
    local argPath="$1"
    [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
    open -a "Visual Studio Code" "$argPath"
  fi
}

###############################################################################
# Extra                                                                       #
###############################################################################

[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"
