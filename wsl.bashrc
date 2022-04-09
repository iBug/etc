# vim:filetype=bash:
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

if [[ "$PWD" =~ /mnt/c/Users/* && "$SHLVL" == 1 ]]; then
  cd "$HOME"
fi

umask 0022
test -x /usr/bin/stty && stty -ixon # disable Ctrl-S freezing
bind "set show-all-if-ambiguous on" # from .inputrc

HISTSIZE=20000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(</etc/debian_chroot)
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

PROMPT_COMMAND() {
  local e=$?
  PROMPT_ECODE=""
  (( e )) && PROMPT_ECODE="$e|"
  return $e
}
PROMPT_COMMAND=PROMPT_COMMAND
PS1='${PROMPT_ECODE}'"$PS1"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto' # iproute2

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..;'
alias sl=ls
alias vi=vim
export EDITOR=vim
CDPATH=":~"

export LESS="-iR --mouse --wheel-lines=3"
export SYSTEMD_LESS="-iFR"
export PAGER="less $LESS"
export GPG_TTY="$(tty)"

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

test -f ~/.bash_aliases && . ~/.bash_aliases
test -f /etc/bash_completion && . /etc/bash_completion
#test -f ~/.Xauthority && export XAUTHORITY=~/.Xauthority

if [ -z "$TMUX" ]; then
  if [ -n "$SSH_CONNECTION" ]; then
    export TMUX_SESSION=ssh
    tmux new-session -A -s "$TMUX_SESSION"
  else
    export TMUX_SESSION=work
    exec tmux new-session -A -s "$TMUX_SESSION"
  fi
fi
