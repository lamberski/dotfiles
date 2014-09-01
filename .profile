###############################################################################
# RVM                                                                         #
###############################################################################

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

###############################################################################
# Homebrew                                                                    #
###############################################################################

export PATH="/usr/local/bin:$PATH"

###############################################################################
# Cocos2d-x                                                                   #
###############################################################################

export COCOS_CONSOLE_ROOT="/Users/lamberski/Projects/Robbie/Boat/cocos2d/tools/cocos2d-console/bin"
export PATH="$COCOS_CONSOLE_ROOT:$PATH"

export ANDROID_SDK_ROOT="/usr/local/opt/android-sdk"
export PATH="$ANDROID_SDK_ROOT:$PATH"

export NDK_ROOT="/usr/local/Cellar/android-ndk/r9d"
export PATH="$NDK_ROOT:$PATH"

###############################################################################
# Aliases                                                                     #
###############################################################################

# Unlock/lock OS X Dock
alias docklock="defaults write com.apple.dock contents-immutable -bool true;killall Dock"
alias dockunlock="defaults write com.apple.dock contents-immutable -bool false;killall Dock"

# Open Sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Composer
alias composer="php composer.phar"

###############################################################################
# Extra                                                                       #
###############################################################################

[[ -s "$HOME/.extra" ]] && source "$HOME/.extra"
