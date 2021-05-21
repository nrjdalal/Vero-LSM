#!/bin/bash

Bold=$(tput bold)

Black=$(tput setaf 0)
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Yellow=$(tput setaf 3)
Blue=$(tput setaf 4)
Magenta=$(tput setaf 5)
Cyan=$(tput setaf 6)
White=$(tput setaf 7)

Off=$(tput sgr0)

abort() {
  printf "%s\n" "$@"
  exit 1
}
