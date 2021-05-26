_LINUX
_ONLYSUDO

echo

read -p "Enter domain name ~ " DOMAIN
read -p "Enter proxy :port ~ " PORT

cat >/etc/nginx/sites-available/$DOMAIN.80.conf <<CONF
server {
  server_name $DOMAIN www.$DOMAIN;

  listen 80;
  listen [::]:80 ipv6only=on;

  location / {
    proxy_pass http://127.0.0.1:$PORT;
  }
}
CONF

ln -s /etc/nginx/sites-available/$DOMAIN.80.conf /etc/nginx/sites-enabled/$DOMAIN.80.conf 2>/dev/null

nginx -s reload

echo "Config created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.80.conf$(tput sgr0)"

echo
