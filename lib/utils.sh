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
src "${UTILS}/onlysudo.sh"
src "${UTILS}/osonly.sh"
