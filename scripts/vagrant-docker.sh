#!/bin/bash

# setup ssh
apt-get update
apt-get install -y openssh-server sudo
mkdir /var/run/sshd
chmod 0755 /var/run/sshd

# create and configure vagrant user
useradd --create-home -s /bin/bash vagrant

# configure SSH access
mkdir -p /home/vagrant/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/vagrant/.ssh/authorized_keys
chown -R vagrant: /home/vagrant/.ssh

# enable passwordless sudo for the "vagrant" user
echo -n 'vagrant:vagrant' | chpasswd
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant

# set locale and create mongo data folder
echo 'export LC_ALL=C' >> /home/vagrant/.bashrc
mkdir -p /data/db