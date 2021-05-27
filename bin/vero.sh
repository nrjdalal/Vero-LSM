#!/bin/bash
set -e

BIN=/usr/bin
LIB=/usr/lib/vero

source $LIB/utils.sh

X=("$@")

$url=$LIB_URL

case ${X[0]} in

add)
  src "$url/add.sh"
  ;;

certbot)
  src "$url/certbot.sh"
  ;;

install | i)
  src "$url/install.sh"
  ;;

maintain)
  src "$url/maintain.sh"
  ;;

nginx)
  src "$url/nginx.sh"
  ;;

-v | -version | --version)
  src "$url/version.sh"
  ;;

esac
