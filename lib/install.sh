echo $@
echo $#

case $1 in
brew | homebrew) src "${LIB_URL}/install/homebrew.sh" ;;
nginx) src "${LIB_URL}/install/nginx.sh" ;;
node | nodejs) src "${LIB_URL}/install/nodejs.sh" ;;
esac
