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

action() {
  printf "${yellow}%s${OFF}\n" "$@"
}

_ACTION() {
  printf "\n${YELLOW}   ${OFF}${BOLD}${yellow} %s${OFF}\n\n" "$@"
  exit 0
}
