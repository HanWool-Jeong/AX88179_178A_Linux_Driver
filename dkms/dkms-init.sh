#!/bin/bash

VERSION="1.20.0"
PKGNAME="asix-ax88179-dkms"

sudo mkdir /usr/src/$PKGNAME-$VERSION/
sudo cp ../source/* /usr/src/$PKGNAME-$VERSION/
sudo cp dkms.conf /usr/src/$PKGNAME-$VERSION/

sudo dkms add $PKGNAME/$VERSION
sudo dkms build $PKGNAME/$VERSION
sudo dkms install $PKGNAME/$VERSION
sudo update-initramfs -u

echo '########################################################################################'
echo 'The module will be installed at /lib/modules/6.1.0-11-amd64/updates/dkms/ax88179_178a.ko'
echo '########################################################################################'
sudo dkms status
