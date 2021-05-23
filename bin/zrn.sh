#!/bin/bash

OS="$(uname)"
case $OS in
Linux)
  LIB=/usr/lib/zrn
  ;;
Darwin)
  LIB=/usr/local/lib/zrn
  ;;
esac

source $LIB/utils.sh

case $1 in
adduser) src "${LIB_URL}/adduser.sh" ;;
install)
  case $2 in
  homebrew) src "${LIB_URL}/homebrew.sh" ;;
  esac
  ;;
update) /bin/bash -c "$(curl -fsSL ${URL}/install.sh)" ;;
upkeep) src "${LIB_URL}/upkeep.sh" ;;
esac
