_LINUX
_ONLYSUDO

echo
curl -fsSL https://nginx.org/keys/nginx_signing.key | gpg --dearmor -o /usr/share/keyrings/nginx_signing.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/nginx_signing.gpg] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" >/etc/apt/sources.list.d/nginx.list
apt update
apt install nginx -y
systemctl enable --now nginx
mkdir -p /etc/nginx/{sites-available,sites-enabled}
echo
