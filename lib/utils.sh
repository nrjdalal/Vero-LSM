src() {
  tmpfile="$(mktemp)"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
  rm $tmpfile
}

echo "heyo"

URL="$URL"
BIN_URL="$BIN_URL"
LIB_URL="$LIB_URL"
UTILS="$UTILS"

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/onlysudo.sh"
src "${UTILS}/osonly.sh"
