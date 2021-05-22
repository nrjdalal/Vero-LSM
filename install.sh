#!/bin/bash

file="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils.sh >$file
source $file
rm $file

if [[ -z "${BASH_VERSION}" ]]; then
  FAILURE "Bash is required to interpret this script."
fi

OS="$(uname)"
case $OS in
Linux)
  echo
  success "Linux detected. Installing zrn."
  LOCATION=/usr/bin/zrn
  ;;
Darwin)
  echo
  success "macOS detected. Installing zrn."
  LOCATION=/usr/local/bin/zrn
  ;;
*) FAILURE "zrn is only supported on macOS and Linux." ;;
esac

curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/bin/zrn.sh >$LOCATION
chmod +x $LOCATION
SUCCESS "zrn is installed."
