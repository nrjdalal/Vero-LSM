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

X=("$@")

case ${X[0]} in
adduser) src "${LIB_URL}/adduser.sh" ;;
install | i) src "${LIB_URL}/install.sh" ;;
update) /bin/bash -c "$(curl -fsSL ${URL}/install.sh)" ;;
upkeep) src "${LIB_URL}/upkeep.sh" ;;
-v | -version | --version) src "${LIB_URL}/version.sh" ;;
esac
