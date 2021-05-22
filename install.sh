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
  BIN=/usr/bin && LIB=/usr/lib/zrn
  ;;
Darwin)
  echo
  success "macOS detected. Installing zrn."
  BIN=/usr/local/bin && LIB=/usr/local/lib/zrn
  ;;
*) FAILURE "zrn is only supported on macOS and Linux." ;;
esac

rootCheck # --- SUDO --- #
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/bin/zrn.sh >$BIN/zrn
chmod +x $BASE/zrn
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils.sh >$LIB/utils.sh
SUCCESS "zrn is installed."
