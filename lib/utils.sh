src() {
  tmpfile="$(mktemp)"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
  rm $tmpfile
}

URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"

BIN_URL="${URL}/bin"
LIB_URL="${URL}/lib"
UTILS="${URL}/utils"

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants

rootCheck() {
  if [[ $(id -u) -ne 0 ]]; then
    _FAILURE "Given command requires sudo access."
  fi
}

src "${UTILS}/osonly.sh"
