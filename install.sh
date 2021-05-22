#!/bin/bash

file="$(mktemp)"
curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/utils.sh >$file
source $file
rm $file

# if [[ -z "${BASH_VERSION}" || -z "${ZSH_VERSION}" ]]; then
# else
#   Abort "Bash/Zsh is required to interpret this script."
# fi

# OS="$(uname)"
# if [[ "$OS" == "Linux" ]]; then
#   LOCATION=/usr/bin
# elif [[ "$OS" == "Darwin" ]]; then
#   LOCATION=/usr/local/bin
# else
#   Abort "zrn is only supported on macOS and Linux."
# fi

OS="$(uname)"
case $OS in
Linux)
  success "Linux detected. Installing zrn."
  LOCATION=/usr/bin
  ;;
Darwin)
  success "macOS detected. Installing zrn."
  LOCATION=/usr/local/bin
  ;;
*) FAILURE "zrn is only supported on macOS and Linux." ;;
esac
