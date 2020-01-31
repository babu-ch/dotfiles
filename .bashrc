COLOR_USER_HOST="\[\e[32m\]"
COLOR_DIR="\[\e[33m\]"
COLOR_RESET="\[\e[0m\]"

# $1 に設定したやつを追加で表示
set_ps1() {
  if [ -z $1 ];
  then
    PS1="${COLOR_USER_HOST}\u@\h:${COLOR_DIR}\W \t > ${COLOR_RESET}"
  else
    PS1="${COLOR_USER_HOST}\u@\h:${COLOR_DIR}\W \t [$1] > ${COLOR_RESET}"
  fi
}
set_ps1

# セッションクローズ時の.bash_historyへの書き込みをoff
shopt -u histappend
# .bash_historyとメモリ上のコピーを頻繁に同期
share_history(){
    history -a
    history -c
    history -r
}

# PROMPT_COMMAND
prompt_dispatch() {
  current=$(git branch 2>/dev/null | grep '*' | cut -f2 -d' ')
  set_ps1 $current
  share_history
}
PROMPT_COMMAND='prompt_dispatch'

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

function gco_select() {
  select branch in $(git branch | sed -e "s/* /[current]/")
  do
    git checkout "$branch"
    break
  done
}
