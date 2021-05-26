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

  return 301 https://$host$request_uri;
}
CONF

cat >/etc/nginx/sites-available/$DOMAIN.443.conf <<CONF
server {
  server_name $DOMAIN www.$DOMAIN;

  listen 443 ssl;
  listen [::]:443 ssl ipv6only=on;

  ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
  include /etc/letsencrypt/options-ssl-nginx.conf;
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

  location / {
    proxy_pass http://127.0.0.1:$PORT;
  }
}
CONF

ln -s /etc/nginx/sites-available/$DOMAIN.80.conf /etc/nginx/sites-enabled/$DOMAIN.80.conf
ln -s /etc/nginx/sites-available/$DOMAIN.443.conf /etc/nginx/sites-enabled/$DOMAIN.443.conf

nginx -s reload

echo "Config 80 created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.80.conf$(tput sgr0)"
echo "Config 443 created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.443.conf$(tput sgr0)"

echo