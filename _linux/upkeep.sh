_LINUX && _ONLYSUDO

echo
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

_SUCCESS "Don't forget to upkeep regularly."
