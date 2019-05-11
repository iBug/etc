#!/data/data/com.termux/files/usr/bin/sh

PS1_PROMPT() {
	local e=$?
	(( e )) && echo -n "$e|"
	return $e
}
PS1='$(PS1_PROMPT)\w \$ '
CDPATH=:$HOME:$PREFIX
export HISTCONTROL=ignoredups

alias ls='ls --color=auto'
alias l='ls -C'
alias la='ls -A'
alias ll='ls -al'
alias ..='cd ..;'

alias r='fc -e -'
alias x='exit'
alias grep='grep --color=auto'

alias cc='cc -pie'
alias cpp='cpp -pie'
alias c++='c++ -pie'
alias gcc='gcc -pie'
alias g++='g++ -pie'

alias tb='toolbox '
alias ty='toybox '
alias sudo='sudo '

alias chcon='/system/bin/chcon'

.import() {
  if [ $# -eq 0 ]; then
    echo "Usage: .import <FILE>" >&2
    return 1
  fi
  while [ $# -ne 0 ]; do
    PATH=$PATH:. . "$1"
    shift
  done
}

umask 0022

export EDITOR=vim GPG_TTY=$(tty)
export GIT_PAGER="less -FR" LESS="-R"

# SELinux Context (for convenience)
export SECON="u:object_r:app_data_file:s0:c512,c768"

# Start OpenSSH daemon
if ! (ps -e | grep -q 'sshd'); then
  #sshd
  :
fi

shopt -s direxpand

# eval $(thefuck --alias)

#if [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
#  export TMUX_SESSION=ssh
#  tmux attach -t "$TMUX_SESSION" 2>/dev/null || tmux new-session -s "$TMUX_SESSION"
#fi
