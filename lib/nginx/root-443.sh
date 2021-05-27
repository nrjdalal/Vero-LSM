_LINUX
_ONLYSUDO

echo

read -p "Enter domain name ~ " DOMAIN

cat >/etc/nginx/sites-available/$DOMAIN.80.conf <<CONF
server {
  server_name $DOMAIN www.$DOMAIN;

  listen 80;
  listen [::]:80;

  return 301 https://\$host\$request_uri;
}
CONF

cat >/etc/nginx/sites-available/$DOMAIN.443.conf <<CONF
server {
  server_name $DOMAIN www.$DOMAIN;

  listen 443 ssl;
  listen [::]:443 ssl;

  ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
  include /etc/letsencrypt/options-ssl-nginx.conf;
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

  root /var/www/$DOMAIN;
}
CONF

ln -s /etc/nginx/sites-available/$DOMAIN.80.conf /etc/nginx/sites-enabled/$DOMAIN.80.conf 2>/dev/null
ln -s /etc/nginx/sites-available/$DOMAIN.443.conf /etc/nginx/sites-enabled/$DOMAIN.443.conf 2>/dev/null

nginx -s reload

echo
echo "Config 80 created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.80.conf$(tput sgr0)"
echo "Config 443 created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.443.conf$(tput sgr0)"
echo
