Version="210524-142806"

URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"
BIN_URL="${URL}/bin"
LIB_URL="${URL}/lib"
UTILS="${URL}/utils"

src() {
  tmpfile="$(mktemp --suffix=.zrn)"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
  rm *.zrn 2>/dev/null
}

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/osonly.sh"
src "${UTILS}/usertype.sh"
