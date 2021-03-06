Version="210528-033952"

URL="https://raw.githubusercontent.com/nrjdalal/Vero-LSM/master"
BIN_URL="${URL}/bin"
LIB_URL="${URL}/lib"
UTILS="${URL}/utils"

randomStr="$(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c12)"

src() {
  tmpfile="/tmp/vero.${randomStr}"
  curl -fsSL $1 >$tmpfile
  source $tmpfile
}

srcpart() {
  tmpfile="/tmp/vero.${randomStr}"
  curl -fsSL $1 | head -n$2 | tail -n$3 >$tmpfile
  source $tmpfile
}

# universal
src "${UTILS}/colors.sh"
src "${UTILS}/status.sh"

# dependants
src "${UTILS}/usertype.sh"
