_DARWIN() {
  if [[ "$(uname)" == "Linux" ]]; then
    _FAILURE "This is macOS only command!"
  fi
}

_LINUX() {
  if [[ "$(uname)" == "Darwin" ]]; then
    _FAILURE "This is Linux only command!"
  fi
}
