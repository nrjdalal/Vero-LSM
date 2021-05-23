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

if [[ "$OS" == "Linux" ]]; then
  case $1 in
  adduser) src "https://raw.githubusercontent.com/nrjdalal/zrn/master/_linux/adduser.sh" ;;
  install) case $2 in
    homebrew) src "https://raw.githubusercontent.com/nrjdalal/zrn/master/_linux/homebrew.sh" ;;
    esac ;;
  upkeep) src "https://raw.githubusercontent.com/nrjdalal/zrn/master/_linux/upkeep.sh" ;;
  esac
fi

case $1 in
update) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/install.sh)" ;;
esac
