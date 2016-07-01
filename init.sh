#!/bin/sh -xe

if [ -z "$authorized_key" ]; then
  echo 'Run container with -e authorized_key="ssh-rsa ..."'
  exit 1
fi

useradd -m tester

# configure public key authentication
mkdir -p -m 700 ~tester/.ssh
echo "$authorized_key" > ~tester/.ssh/authorized_keys
chmod 600 ~tester/.ssh/authorized_keys
chown -R tester:tester ~tester/.ssh

# configure sudo without password
touch /etc/sudoers.d/tester
chmod 440 /etc/sudoers.d/tester
echo "tester ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/tester

exec /usr/sbin/sshd -D -e
