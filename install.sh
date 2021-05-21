#!/bin/bash
set -u

abort() {
  printf "%s\n" "$@"
  exit 1
}

if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
else
  abort "You no how to bash, nice!"
fi

# # getting utilities
# file=$(mktemp)
# cat utils.sh >$file
# # curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/install.sh >$file
# source $file
# rm $file

# OS="$(uname)"
# if [[ "$OS" == "Linux" ]]; then
#   HOMEBREW_ON_LINUX=1
# elif [[ "$OS" != "Darwin" ]]; then
#   abort "Homebrew is only supported on macOS and Linux."
# fi
