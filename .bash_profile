alias gs="git status"
alias gpom="git push origin master"
alias gb="git branch"
alias gl="git log --oneline --decorate --graph --all"
alias ls="ls -p --color=auto $*"
alias e.="explorer ."
alias nn='nvim-qt &'
alias ..='cd ..'
alias ...='cd ../..'
export FZF_DEFAULT_COMMAND='rg --files 2>NUL'
# export FZF_DEFAULT_COMMAND='rg --files 2>/dev/null'
export RIPGREP_CONFIG_PATH="$HOME/.rgconf"
source /c/dev/utils/nightly.sh
source /c/dev/utils/go.sh
