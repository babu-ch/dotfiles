# alias
alias eb="vi ~/.bashrc"
alias ebp="vi ~/.bash_profile"
alias vimrc="vi ~/.vimrc"
alias re="source ~/.bash_profile"
alias ll="ls -ltG"
alias lla="ls -altG"
alias vi="vim -p"
alias grep='grep --color'
alias grepr='grep -r'
alias grepri='grep -ri'
alias wcl='wc -l'

# chdir
alias cd-="cd -"
alias ..="cd ..;pwd;ll"
alias ...="cd ../../;pwd;ll"
alias downloads="cd ~/Downloads;pwd;ll"
alias develop="cd ~/develop;pwd;ll"

# git
alias g='git'
alias gl='git log'
alias glo='git log --oneline'
alias ga='git add'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gdc='git diff --cached'
alias gs='git status'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch'
alias gba='git branch -a'
alias gst='git status'
alias gco='git checkout'
alias gcot='git checkout -t'
alias gcob='git checkout -b'
alias gco-='git checkout -'
alias gf='git fetch'
alias gfa='git fetch -a'
alias gc='git commit'
alias gci='git commit -m'
alias gr='git rebase'
alias grabort='git rebase --abort'
alias grcontinue='git rebase --continue'
alias grskip='git rebase --skip'
alias greset='git reset'
alias gstash='git stash'
alias gstashu='git stash -u'

alias vstat='vagrant status'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vssh='vagrant ssh'

alias artisan='php artisan'

#typo
alias v='vi'
alias vvi='vi'
alias bi='vi'
alias vbi='vi'
alias bvi='vi'
alias vr='vi -R'

# ni
alias nrt='nr test'
alias nrs='nr serve'
