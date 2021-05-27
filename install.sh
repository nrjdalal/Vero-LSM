#!/bin/bash

tmpfile="$(mktemp --suffix=.zrn)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils/utils.sh >$tmpfile
source $tmpfile
rm *.zrn 2>/dev/null

echo && echo $Version

if [[ -z "${BASH_VERSION}" ]]; then
  _FAILURE "Bash is required to interpret this script."
fi

# OS="$(uname)"
# case $OS in
# Linux)
#   echo
#   success "Linux detected. Installing zrn."
#   BIN=/usr/bin && LIB=/usr/lib/zrn
#   ;;
# Darwin)
#   echo
#   success "macOS detected. Installing zrn."
#   BIN=/usr/local/bin && LIB=/usr/local/lib/zrn
#   ;;
# *) _FAILURE "zrn is only supported on macOS and Linux." ;;
# esac

if [[ "$(uname)" == "Linux" ]]; then
  success "Linux detected. Installing zrn."
  BIN=/usr/bin && LIB=/usr/lib/zrn
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
