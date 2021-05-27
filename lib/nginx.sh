case ${X[1]} in
proxy-80) src "${LIB_URL}/nginx/proxy-80.sh" ;;
proxy-443) src "${LIB_URL}/nginx/proxy-443.sh" ;;
root-80) src "${LIB_URL}/nginx/root-80.sh" ;;
esac
