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
adduser) src "https://raw.githubusercontent.com/nrjdalal/zrn/master/_linux/adduser.sh" ;;
update) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/install.sh)" ;;
upkeep) src "https://raw.githubusercontent.com/nrjdalal/zrn/master/_linux/upkeep.sh" ;;
esac
