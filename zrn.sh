#!/bin/bash

updated_version="0.0.4-rc"

# sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh)"

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
  echo
  echo "current_version=$updated_version"

  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >$ZRN | sed -n '3p'
  chmod +x $ZRN

  echo
  echo "success: $(tput setaf 2)zrn added successfully!$(tput sgr0)"
  echo
  exit 0
}

# ------------------------------ 01) installation ------------------------------

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

if [[ ! -x "$ZRN" ]]; then

  rootCheck
  addZrn

fi

case $1 in

# ------------------------------ 02) update ------------------------------

update)

  rootCheck
  addZrn

  ;;

# ------------------------------ SELF HELP ------------------------------

*)
  echo
  echo "be careful what you wish for!"
  echo
  ;;

esac
