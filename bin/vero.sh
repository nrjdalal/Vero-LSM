#!/bin/bash
set -e
data=("$@")
source /usr/lib/vero/utils.sh

url="$LIB_URL"

case ${data[0]} in

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
