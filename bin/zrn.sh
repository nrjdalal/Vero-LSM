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
esac
