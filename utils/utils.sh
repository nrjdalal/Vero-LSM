Version="210527-215132"

BIN=/usr/bin && LIB=/usr/lib/zrn

URL="https://raw.githubusercontent.com/nrjdalal/zrn/master"
BIN_URL="${URL}/bin"
LIB_URL="${URL}/lib"
UTILS="${URL}/utils"

randomStr="$(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c12)"

src() {
  tmpfile="/tmp/zrn.${randomStr}"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
}

srcpart() {
  tmpfile="/tmp/zrn.${randomStr}"
  curl -fsSL $1 | head -n$2 | tail -n$3 >$tmpfile
  source $tmpfile
}

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/osonly.sh"
src "${UTILS}/usertype.sh"
