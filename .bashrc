PS1="\[\e[32m\e[1m\]\W \t > \[\e[0m\]"

# bind
bind -x '"\C-k\C-k" : ll'
bind -x '"\C-k\C-p" : pwd'

bind -x '"\C-g\C-b" : git branch'

# alias
source ~/.bash_aliases

# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}
