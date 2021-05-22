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

echo "Be ${BOLD} BOLD${OFF}"
