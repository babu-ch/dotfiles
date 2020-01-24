COLOR_USER_HOST="\[\e[32m\]"
COLOR_DIR="\[\e[33m\]"
COLOR_RESET="\[\e[0m\]"
PS1="${COLOR_USER_HOST}\u@\h:${COLOR_DIR}\W \t > ${COLOR_RESET}"

# セッションクローズ時の.bash_historyへの書き込みをoff
shopt -u histappend
# .bash_historyとメモリ上のコピーを頻繁に同期
share_history(){
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'

# bind
if [ -t 1 ];then
    bind -x '"\C-k\C-k" : ll'
    bind -x '"\C-k\C-p" : pwd'

    bind -x '"\C-g\C-b" : echo "git branch";git branch'
    bind -x '"\C-g\C-d" : echo "git diff";git diff'

    bind '"\C-f": forward-word'
    bind '"\C-b": backward-word'
fi

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi

# alias
source ~/.bash_aliases

# function
function vimemo() {
    vi ~/memos/memo_`date +%Y_%m_%d`
}

function lastdir() {
  dir=$(cat ~/.lastdir)
  echo $dir
  cd $dir
}

function removeLastLine() {
  ruby -i -e 'print ARGF.read.strip' $1
}
