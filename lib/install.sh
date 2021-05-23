echo "Reaching the script"
echo $#
echo $1
echo $2

case $2 in
brew | homebrew) src "${LIB_URL}/install/homebrew.sh" ;;
nginx) src "${LIB_URL}/install/nginx.sh" ;;
node | nodejs) src "${LIB_URL}/install/nodejs.sh" ;;
esac
