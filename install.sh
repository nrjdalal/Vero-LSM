#!/bin/bash

abort() {
  printf "%s\n" "$@"
  exit 1
}

OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  HOMEBREW_ON_LINUX=1
elif [[ "$OS" != "Darwin" ]]; then
  abort "Homebrew is only supported on macOS and Linux."
fi
