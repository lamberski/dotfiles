# Load .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Enable plugins
plugins=(git)

# Load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"
