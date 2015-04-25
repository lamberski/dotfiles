###############################################################################
# Homebrew                                                                    #
###############################################################################

export PATH="$HOME/.homebrew/bin:$PATH"

###############################################################################
# Composer                                                                    #
###############################################################################

export PATH="$HOME/.composer/vendor/bin:$PATH"

###############################################################################
# RVM                                                                         #
###############################################################################

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

###############################################################################
# Aliases                                                                     #
###############################################################################

# Unlock/lock OS X Dock
alias docklock="defaults write com.apple.dock contents-immutable -bool true;killall Dock"
alias dockunlock="defaults write com.apple.dock contents-immutable -bool false;killall Dock"

# Other stuff
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias t="tree"

###############################################################################
# Extra                                                                       #
###############################################################################

[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"
