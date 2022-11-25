# zsh config
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DEFAULT_USER="chao"

# zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# oh-my-zsh config
source $ZSH/oh-my-zsh.sh

# environment
export LANG=en_US.UTF-8

# common alias
source $myenv/alias.sh
