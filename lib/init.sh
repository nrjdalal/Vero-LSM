_ONLYSUDO

apt update
apt upgrade -y

apt install snapd -y
snap install core
snap refresh core

apt install build-essential -y
mkdir -p /var/www

apt autoremove -y
