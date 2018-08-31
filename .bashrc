PS1="\[\e[32m\e[1m\][\u \W \t]\[\e[0m\]\\$ "

# alias
alias eb="vi ~/.bash_profile"
alias vimrc="vi ~/.vimrc"
alias re="source ~/.bash_profile"
alias ll="ls -ltG"
alias lla="ls -altG"
alias vi="vim -p"

# alias git
alias br='git branch'
alias pull='git pull'
alias gco='git checkout'

# bind


# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}

