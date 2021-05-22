_ONLYSUDO() {
  if [[ $(id -u) -ne 0 ]]; then
    _FAILURE "Given command requires sudo access."
  fi
}
