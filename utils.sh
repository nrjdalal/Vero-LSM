#!/bin/bash

black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

BLACK=$(tput setab 0)
RED=$(tput setab 1)
GREEN=$(tput setab 2)
YELLOW=$(tput setab 3)
BLUE=$(tput setab 4)
MAGENTA=$(tput setab 5)
CYAN=$(tput setab 6)
WHITE=$(tput setab 7)

BOLD=$(tput bold)
OFF=$(tput sgr0)

success() {
  printf "${green}%s${OFF}\n" "$@"
}

_SUCCESS() {
  printf "\n${GREEN}   ${OFF}${BOLD}${green} %s${OFF}\n\n" "$@"
  exit 0
}

failure() {
  printf "${red}%s${OFF}\n" "$@"
}

_FAILURE() {
  printf "\n${RED}   ${OFF}${BOLD}${red} %s${OFF}\n\n" "$@"
  exit 1
}

rootCheck() {
  if [[ $(id -u) -ne 0 ]]; then
    _FAILURE "Given command requires sudo access."
  fi
}

src() {
  file="$(mktemp)"
  curl -fsSL $1 >$file
  source $file
  rm $file
}

_DARWIN() {
  if [[ "$(uname)" != "Linux" ]]; then
    _FAILURE "This is macOS only command!"
  fi
}

_LINUX() {
  if [[ "$(uname)" != "Linux" ]]; then
    _FAILURE "This is Linux only command!"
  fi
}
