#!/data/data/com.termux/files/usr/bin/sh

PS1_PROMPT() {
	local e=$?
	(( e )) && echo -n "$e|"
	return $e
}
PS1='$(PS1_PROMPT)\w \$ '
shopt -s direxpand

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
alias su='tsu'

alias chcon='/system/bin/chcon'

umask 0022

export PATH=$HOME/.local/bin:$PATH
export HISTCONTROL=ignoredups
export CDPATH=:$HOME
export EDITOR=vim GPG_TTY=$(tty)
export GIT_PAGER="less -FR" LESS="-R"

# SELinux Context (for convenience)
export SECON="u:object_r:app_data_file:s0:c512,c768"

if [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  export TMUX_SESSION=ssh
  tmux attach -t "$TMUX_SESSION" 2>/dev/null || tmux new-session -s "$TMUX_SESSION"
fi
