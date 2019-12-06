#!/bin/bash

git submodule init
git submodule update --remote

DEBIAN_VER=`cat WiringPi/debian-template/wiringPi/DEBIAN/control | grep Version | awk -F "-" '{print $2}'`

python3 setup.py --command-packages=stdeb.command sdist_dsc --debian-version $DEBIAN_VER bdist_deb

echo ""
ls -al deb_dist/*.deb
echo ""
