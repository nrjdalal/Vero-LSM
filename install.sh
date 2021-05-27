#!/bin/bash

echo

tmpfile="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/Vero-LSM/master/utils/utils.sh >$tmpfile
source $tmpfile
rm $tmpfile

if [[ -z "${BASH_VERSION}" ]]; then
  _FAILURE "Bash is required to interpret this script."
fi

if [[ "$(uname)" == "Linux" ]]; then
  success "Installing Vero ver. ${Version}."
else
  failure "Seems like you're using $(uname)."
  _FAILURE "Vero is only supported on Linux."
fi

_ONLYSUDO
# adding Vero to bin
curl -fsSL $BIN_URL/vero.sh >$BIN/vero
chmod +x $BIN/vero
# adding utils to lib
mkdir -p $LIB/vero
curl -fsSL $UTILS/utils.sh >$LIB/utils.sh

_SUCCESS "vero is successfully installed."
