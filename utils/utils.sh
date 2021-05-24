Version="210524-171136"

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

srcpart() {
  tmpfile="$(mktemp --suffix=.zrn)"
  curl -fsSL $1 | head -n$2 | tail -n$3 >$tmpfile
  source $tmpfile
  rm *.zrn 2>/dev/null
}

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/osonly.sh"
src "${UTILS}/usertype.sh"
