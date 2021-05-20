#!/bin/bash

ZRN=/usr/local/bin/zrn

if [[ ! -x "$ZRN" ]]; then

  if [[ $(id -u) -ne 0 ]]; then
    echo
    echo "error: installation must be done using $(tput setaf 3)sudo$(tput sgr0)"
    echo
    exit 1
  fi

  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/zrn.sh >/usr/local/bin/zrn
  chmod +x /usr/local/bin/zrn

  echo
  echo "success: $(tput setaf 2)zrn installed successfully$(tput sgr0)"
  echo
  exit 0

fi

echo "zrn is already installed"
