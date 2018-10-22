PS1="\[\e[32m\e[1m\][\u \W \t]\[\e[0m\]\\$ "

# alias
alias eb="vi ~/.bashrc"
alias vimrc="vi ~/.vimrc"
alias re="source ~/.bashrc"
alias ll="ls -ltG"
alias lla="ls -altG"
alias vi="vim -p"
alias grep='grep --color'

# alias git
alias br='git branch'
alias pull='git pull'
alias gco='git checkout'
alias gadd='git add'
alias gci='git commit -m'
alias gdiff='git diff'
alias glog='git log'

# bind


# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}

