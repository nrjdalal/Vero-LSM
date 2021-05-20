#!/bin/bash

# ------------------------------ 00) functions ------------------------------

rootCheck() {
  if [[ $(id -u) -ne 0 ]]; then
    echo
    echo "error: given command must be run using $(tput setaf 3)sudo$(tput sgr0)"
    echo
    exit 1
  fi
}

addZrn() {
  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >$ZRN
  chmod +x $ZRN
}

# ------------------------------ 01) getting os ------------------------------

case $(uname) in

Darwin) ZRN=/usr/local/bin/zrn ;;
Linux) ZRN=/usr/bin/zrn ;;
*)
  echo
  echo "os not supported yet! tune in later!"
  echo
  exit 0
  ;;

esac

# ------------------------------ 02) installation ------------------------------

if [[ ! -x "$ZRN" ]]; then

  rootCheck

  addZrn

  echo
  echo "success: $(tput setaf 2)zrn installed successfully!$(tput sgr0)"
  echo
  exit 0

fi

case $1 in

# ------------------------------ 03) update ------------------------------

update)

  rootCheck

  addZrn

  echo
  echo "success: $(tput setaf 2)zrn updated successfully!$(tput sgr0)"
  echo
  exit 0
  ;;

# ------------------------------ SELF HELP ------------------------------

*) echo "be careful what you wish for!" ;;

esac
