# zrn installer

## Install zrn (on macOS or Linux)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/master/install.sh)"
```

user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/\*.conf;

events {
worker_connections 768; # multi_accept on;
}

http {
sendfile on;
tcp_nopush on;
tcp_nodelay on;
keepalive_timeout 65;
types_hash_max_size 2048;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        gzip on;

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;

}

server {

server_name <domain.com> <www.domain.com>;

location / {
proxy_pass http://127.0.0.1:3003;
}

listen [::]:443 ssl ipv6only=on;
listen 443 ssl;
ssl_certificate /etc/letsencrypt/live/alfa.xamyr.com-0001/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/alfa.xamyr.com-0001/privkey.pem;
include /etc/letsencrypt/options-ssl-nginx.conf;
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

}

server {

if ($host = <domain.com>) {
  return 301 https://$host$request_uri;
}

if ($host = <www.domain.com>) {
  return 301 https://$host$request_uri;
}

listen [::]:80 ipv6only=on;
listen 80;
server_name <domain.com> <www.domain.com>;
return 404;

}

certbot certonly --agree-tos --manual --preferred-challenges dns -m domain@exampl.com -d \*.exampl.com

server {
server_name \*.markthebrand.com;

listen [::]:80 ipv6only=on;
listen 80;

return 301 https://$host$request_uri;
}

server {
server_name \*.markthebrand.com;

listen [::]:443 ssl ipv6only=on;
listen 443 ssl;

ssl_certificate /etc/letsencrypt/live/markthebrand.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/markthebrand.com/privkey.pem;
include /etc/letsencrypt/options-ssl-nginx.conf;
ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}
