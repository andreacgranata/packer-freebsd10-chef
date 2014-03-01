#!/bin/sh

rm -fv /var/db/dhclient.leases.*
dd if=/dev/zero of=/zeroes bs=1M
rm -f /zeroes
rm -f /home/vagrant/
