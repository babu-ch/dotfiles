PS1="\[\e[32m\e[1m\]\W \t > \[\e[0m\]"

# bind
bind -x '"\C-k\C-k" : ll'

# alias
source ~/.bash_aliases

# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}
