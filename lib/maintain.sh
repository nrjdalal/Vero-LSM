_ONLYSUDO

echo
apt update
apt upgrade -y
apt autoremove -y

_SUCCESS "Don't forget to upkeep time to time!"
