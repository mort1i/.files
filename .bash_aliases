# some ls aliases
alias ll='ls -lhF'
alias la='ls -lhFA'
alias l='ls -CF'
alias lsd='ls -lAd */'

# shortcuts
alias df='df -Tha --total'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias cleanboot="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge"
alias nocomment='egrep -v "^\s+?#|^\s+?$"'
alias tamux='tmux attach || tmux new'
