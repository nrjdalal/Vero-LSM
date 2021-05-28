_ONLYSUDO

read -p "Enter domain name ~ " DOMAIN

if [ -f "/etc/nginx/sites-available/$DOMAIN.80.conf" ]; then
  rm -f /etc/nginx/sites-available/$DOMAIN.80.conf
fi

cat >/etc/nginx/sites-available/$DOMAIN.80.conf <<CONF
server {
  server_name $DOMAIN www.$DOMAIN;

  listen 80;
  listen [::]:80;

  root /var/www/$DOMAIN;
}
CONF

ln -s /etc/nginx/sites-available/$DOMAIN.80.conf /etc/nginx/sites-enabled/$DOMAIN.80.conf 2>/dev/null

nginx -s reload

echo
echo "Config created. Verify by ~ $(tput setaf 3)cat /etc/nginx/sites-enabled/$DOMAIN.80.conf$(tput sgr0)"
