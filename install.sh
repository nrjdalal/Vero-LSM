#!/bin/bash

tmpfile="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/Vero-LSM/master/utils/utils.sh >$tmpfile
source $tmpfile
rm $tmpfile

if [[ -z "${BASH_VERSION}" ]]; then
  _FAILURE "Script can only be run using Bash!"
fi

echo

if [[ "$(uname)" != "Linux" ]]; then
  failure "Seems like you're using $(uname)."
  _FAILURE "Vero is only supported on Linux."
fi

success "Installing Vero ver. ${Version}."

_ONLYSUDO
# adding Vero to bin
BIN=/usr/bin
curl -fsSL $BIN_URL/vero.sh >$BIN/vero
chmod +x $BIN/vero
# adding utils to lib
LIB=/usr/lib/vero
mkdir -p $LIB
curl -fsSL $UTILS/utils.sh >$LIB/utils.sh

_SUCCESS "Vero is successfully installed."
