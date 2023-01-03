# common config for all system
myenv=~/myenv
source $myenv/zshrc_common.sh

# macos only alias
alias wt='cd ~/Documents/wordtool && java -jar wordtool.jar'
alias octave='/usr/local/bin/octave'
alias unproxy="unset http_proxy;unset https_proxy;unset all_proxy"
alias cdvim="cd ~/.config/nvim/lua/user"
alias cdpp="cd ~/Documents/lab/graduate_design/paper"

# macos only env var
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:/usr/local/mysql/bin"

# proxy
alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"

######## on start ########

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--reverse --preview 'bat --style=numbers --theme=gruvbox-light --line-range :500 {}'"
export PATH=$PATH:/usr/local/texlive/2022/bin/universal-darwin
