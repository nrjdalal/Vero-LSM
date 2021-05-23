#!/bin/bash

tfile="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils/utils.sh >$tfile
source $tfile
rm $tfile

if [[ -z "${BASH_VERSION}" ]]; then
  _FAILURE "Bash is required to interpret this script."
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
*) _FAILURE "zrn is only supported on macOS and Linux." ;;
esac

_ONLYSUDO
# ADDING ZRN TO BIN
curl -fsSL $BIN_URL/zrn.sh >$BIN/zrn
chmod +x $BIN/zrn
# ADDING UTILS TO LIB
mkdir -p $LIB/zrn
curl -fsSL $UTILS/utils.sh >$LIB/utils.sh

_SUCCESS "zrn is successfully installed."
