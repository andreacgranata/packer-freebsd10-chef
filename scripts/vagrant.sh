# Vagrant specific
date > /usr/local/etc/vagrant_box_build_time

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
fetch -o /home/vagrant/.ssh/authorized_keys https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
