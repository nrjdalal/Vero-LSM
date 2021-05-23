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

echo $#
echo $1
echo $2

case $1 in
adduser) src "${LIB_URL}/adduser.sh" ;;
install) src "${LIB_URL}/install.sh" ;;
update) /bin/bash -c "$(curl -fsSL ${URL}/install.sh)" ;;
upkeep) src "${LIB_URL}/upkeep.sh" ;;
esac
