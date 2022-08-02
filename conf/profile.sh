umask 0077
TIMESTYLE="%d.%m.%Y %H:%M:%S"

alias l=`which ls`
alias ls="ls -h -l -p -A --color=auto --time-style=+\"  $TIMESTYLE\""

# customize ls colors
LS_COLORS=$LS_COLORS:'di=0;96:'
export LS_COLORS
