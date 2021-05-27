#!/bin/bash
set -e

BIN=/usr/bin
LIB=/usr/lib/vero

source $LIB/utils.sh

X=("$@")

case ${X[0]} in
adduser) src "${LIB_URL}/adduser.sh" ;;
certbot) src "${LIB_URL}/certbot.sh" ;;
install | i) src "${LIB_URL}/install.sh" ;;
maintain) src "${LIB_URL}/maintain.sh" ;;
nginx) src "${LIB_URL}/nginx.sh" ;;
update) /bin/bash -c "$(curl -fsSL ${URL}/install.sh)" ;;
-v | -version | --version) src "${LIB_URL}/version.sh" ;;
esac

_SUCCESS "Task executed successfully!"
