#!/bin/bash

abort() {
  printf "%s\n" "$@"
  exit 1
}

OS="$(uname)"
if [[ "$OS" == "Linux" ]]; then
  echo "linux"
elif [[ "$OS" == "Darwin" ]]; then
  echo "darwin"
fi
