#!/bin/bash
if [ -n $USER ]; then
  echo "INFO: Creating user $user";
  useradd -s /bin/bash $user;
fi

mkdir /home/$USER/.ssh
chmod 700 /home/$USER/.ssh
cat /keys/* >> /home/$USER/.ssh/authorized_keys
chown -R $USER: /home/$USER/.ssh
chmod 700 /home/$USER/.ssh/authorized_keys

exec /usr/sbin/sshd -D -e