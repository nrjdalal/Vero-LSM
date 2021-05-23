_LINUX && _ONLYSUDO

flag=false
while [ $flag != true ]; do
  echo
  read -p "Username: " USERNAME
  adduser $USERNAME --disabled-login --gecos GECOS >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

flag=false
while [ $flag != true ]; do
  echo
  passwd $USERNAME >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

usermod -aG sudo $USERNAME

mkdir -p /var/www
chown $USERNAME:$USERNAME /var/www

_SUCCESS "su - $USERNAME"
