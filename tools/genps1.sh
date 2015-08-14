#!/bin/bash

save () {
  if [ `grep -Ec "^PS1=" ~/.bashrc` -gt 0 ]; then
    escaped=$(printf "%q" "PS1='$PS1'")
    sed -i "s|^PS1=.*$|$escaped|" ~/.bashrc
  else
  echo "PS1='$PS1'" >> ~/.bashrc
  echo "export PS1" >> ~/.bashrc

fi
}

c1=$(( $RANDOM % 230 + 1 ))
c2=$(( $RANDOM % 230 + 1 ))
c3=$(( $RANDOM % 230 + 1 ))
c4=$(( $RANDOM % 230 + 1 ))
PS1="\[\033[38;5;${c1}m\]\u\[\033[38;5;${c2}m\]@\[\033[38;5;${c3}m\]\h\[\033[00m\]:\[\033[38;5;${c4}m\]\W\[\033[00m\]\$ "
export PS1
