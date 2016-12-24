# .bashrc

export SEND_256_COLORS_TO_REMOTE=1

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# 256 colors 
case "$TERM" in
  'xterm') TERM=xterm-256color;;
  'screen') TERM=screen-256color;;
  'Eterm') TERM=Eterm-256color;;
esac
export TERM

# User specific aliases and functions
PS1='\[\033[38;5;197m\]\u\[\033[38;5;31m\]@\[\033[38;5;99m\]\h\[\033[00m\]:\[\033[38;5;29m\]\W\[\033[00m\]\$ '

alias vi=vim
alias ll='ls -alh'

# Git pretty log
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %C(cyan)%an%Creset' --abbrev-commit --date=relative"

# Python startup script
export PYTHONSTARTUP=~/.pythonrc
