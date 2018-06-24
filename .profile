###############################################################################
# Homebrew                                                                    #
###############################################################################

export PATH="$HOME/.homebrew/bin:$PATH"

###############################################################################
# Composer                                                                    #
###############################################################################

export PATH="$HOME/.composer/vendor/bin:$PATH"

###############################################################################
# Aliases                                                                     #
###############################################################################

# Unlock/lock OS X Dock
alias docklock="defaults write com.apple.dock contents-immutable -bool true;killall Dock"
alias dockunlock="defaults write com.apple.dock contents-immutable -bool false;killall Dock"

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

###############################################################################
# Initial Commands                                                            #
###############################################################################

cd "$HOME/Projects"
