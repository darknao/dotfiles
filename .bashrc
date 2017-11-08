# .bashrc

export SEND_256_COLORS_TO_REMOTE=1

# 256 colors 
case "$TERM" in
  'xterm') TERM=xterm-256color;;
  'screen') TERM=screen-256color;;
  'Eterm') TERM=Eterm-256color;;
esac
export TERM

alias vi=vim
alias ll='ls -alh'

# Git pretty log
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %C(cyan)%an%Creset' --abbrev-commit --date=relative"

# Python startup script
export PYTHONSTARTUP=~/.pythonrc
