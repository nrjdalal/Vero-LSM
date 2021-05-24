case ${X[1]} in
brew | homebrew) src "${LIB_URL}/install/homebrew.sh" ;;
gh) src "${LIB_URL}/install/gh.sh" ;;
nginx) src "${LIB_URL}/install/nginx.sh" ;;
node | nodejs) src "${LIB_URL}/install/nodejs.sh" ;;
esac
