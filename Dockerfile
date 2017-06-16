FROM ubuntu:latest
MAINTAINER Mike Wilson <geekinutah@gmail.com>

ENV TERM=xterm-256color

RUN apt-get -q update >/dev/null \
  && apt-get install -y openssh-server \
  && mkdir /var/run/sshd \

  # Auto-create user's homedir
  && echo -e "\n# Auto-create user's homedir" >> /etc/pam.d/common-account \
  && echo "session    required   pam_mkhomedir.so skel=/etc/skel/ umask=${HOMEDIR_UMASK:-0077}" >> /etc/pam.d/common-account \

  # Cleanup
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/ 

VOLUME ["/keys"]

COPY start_ssh_server.sh /usr/bin/start_ssh_server.sh

ENTRYPOINT ["/usr/bin/start_ssh_server.sh"]
