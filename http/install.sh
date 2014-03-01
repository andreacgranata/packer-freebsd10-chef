PARTITIONS=ada0
DISTRIBUTIONS="base.txz kernel.txz"

#!/bin/sh
cat >> /boot/loader.conf <<EOF
vboxdrv_load="YES"
virtio_balloon_load="YES"
virtio_blk_load="YES"
virtio_scsi_load="YES"
EOF

cat >> /etc/rc.conf <<EOF
hostname="freebsd10-vm.vagrant"
ifconfig_em0="DHCP"
keymap="it.iso.kbd"
sshd_enable="YES"
dumpdev="AUTO"
vboxnet_enable="YES"
vboxguest_enable="YES"
vboxservice_enable="YES"
ifconfig_vtnet0_name="em0"
ifconfig_vtnet1_name="em1"
EOF

cat >> /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

echo 'WITHOUT_X11="YES"' >> /etc/make.conf

env ASSUME_ALWAYS_YES=1 pkg bootstrap
pkg update
pkg install -y sudo bash ca_root_nss virtualbox-ose-additions ruby19-gems
pkg autoremove

echo 'vagrant' | pw usermod root -h 0
echo 'vagrant' | pw useradd -n vagrant -s /usr/local/bin/bash -m -h 0 -G wheel
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /usr/local/etc/sudoers





