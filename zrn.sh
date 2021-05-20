#!/bin/bash

version="0.0.6-rc"

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

checkLatest() {

  latest_version="$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh | sed -n '3p' | sed 's/version="//' | sed 's/"//')"

}

addZrn() {

  checkLatest
  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >$ZRN
  chmod +x $ZRN

  echo
  echo "success: $(tput setaf 2)added zrn $latest_version$(tput sgr0)"
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

version)

  checkLatest

  echo
  if [[ "$version" == "$latest_version" ]]; then
    echo "you're using the latest verion $version"
  else
    echo "newer version available $version -> $(tput setaf 2)$latest_version$(tput sgr0)"
    echo "run $(tput setaf 3)sudo zrn update$(tput sgr0) to upgrade"
  fi
  echo

  ;;

# ------------------------------ 03) update ------------------------------

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
