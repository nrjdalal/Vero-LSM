#!/bin/bash

echo

tmpfile="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils/utils.sh >$tmpfile
source $tmpfile
rm $tmpfile

if [[ -z "${BASH_VERSION}" ]]; then
  _FAILURE "Bash is required to interpret this script."
fi

if [[ "$(uname)" == "Linux" ]]; then
  success "Installing zrn ver. ${Version}."
else
  _FAILURE "zrn is only supported on Linux."
fi

_ONLYSUDO
# ADDING ZRN TO BIN
curl -fsSL $BIN_URL/zrn.sh >$BIN/zrn
chmod +x $BIN/zrn
# ADDING UTILS TO LIB
mkdir -p $LIB/zrn
curl -fsSL $UTILS/utils.sh >$LIB/utils.sh

_SUCCESS "zrn is successfully installed."
