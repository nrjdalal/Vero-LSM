#!/bin/bash

# identifying os
case $(uname) in

Darwin) ZRN=/usr/local/bin/zrn ;;

Linux) ZRN=/usr/bin/zrn ;;

*)
  echo
  echo "OS not supported yet! Tune in later!"
  echo
  exit 0
  ;;

esac

# zrn installation
if [[ ! -x "$ZRN" ]]; then

  if [[ $(id -u) -ne 0 ]]; then
    echo
    echo "error: installation must be done using $(tput setaf 3)sudo$(tput sgr0)"
    echo
    exit 1
  fi

  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >$ZRN
  chmod +x $ZRN

  echo
  echo "success: $(tput setaf 2)zrn installed successfully!$(tput sgr0)"
  echo
  exit 0

fi

case $1 in

# zrn update
update)

  if [[ $(id -u) -ne 0 ]]; then
    echo
    echo "error: update must be done using $(tput setaf 3)sudo$(tput sgr0)"
    echo
    exit 1
  fi

  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >$ZRN
  chmod +x $ZRN

  echo
  echo "success: $(tput setaf 2)zrn updated successfully!$(tput sgr0)"
  echo
  exit 0
  ;;

# zrn help
*) echo "be careful what you wish for!" ;;

esac
