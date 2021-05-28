_ONLYSUDO

flag=false
while [ $flag != true ]; do
  read -p "Username: " USERNAME
  adduser $USERNAME --disabled-login --gecos GECOS >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

flag=false
while [ $flag != true ]; do
  passwd $USERNAME >/dev/null
  if [ $? == 0 ]; then
    flag=true
  fi
done

# usermod -aG sudo $USERNAME

# mkdir -p /var/www
# chown $USERNAME:$USERNAME /var/www

# _SUCCESS "su - $USERNAME"

groupadd grwx || true
usermod -aG grwx $USERNAME
chgrp -R grwx /var
chmod -R g+rwx /var
