PS1="\[\e[32m\e[1m\][\u \W \t]\[\e[0m\]\\$ "

# bind
source ~/.bash_aliases

# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}
