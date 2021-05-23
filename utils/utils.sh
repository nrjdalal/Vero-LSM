URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"
BIN_URL="${URL}/bin"
LIB_URL="${URL}/lib"
UTILS="${URL}/utils"

src() {
  tmpfile="$(mktemp)"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
  rm $tmpfile
}

src "${UTILS}/version.sh"

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/osonly.sh"
src "${UTILS}/usertype.sh"
