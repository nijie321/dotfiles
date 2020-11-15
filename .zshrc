export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="agnoster"


plugins=(git)


source $ZSH/oh-my-zsh.sh



alias ..="cd .."
alias gs="git status"
alias gp="git pull"
alias gb="git branch"
alias ga="git add ."
alias gc="git commit -m $1"
alias txa="tmux a -t $1"
alias txls="tmux ls"
