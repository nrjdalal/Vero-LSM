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

SUCCESS() {
  printf "\n${BOLD}${green}%s${OFF}\n\n" "$@"
  exit 0
}

failure() {
  printf "${red}%s${OFF}\n" "$@"
}

FAILURE() {
  printf "\n${BOLD}${red}%s${OFF}\n\n" "$@"
  exit 1
}

rootCheck() {
  if [[ $(id -u) -ne 0 ]]; then
    FAILURE "given command requires sudo access"
  fi
}
