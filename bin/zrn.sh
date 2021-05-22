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

src "https://raw.githubusercontent.com/nrjdalal/zrn/master/linux/adduser.sh"
