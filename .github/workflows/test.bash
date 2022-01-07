#!/bin/bash

set -e
cd /ros2-galactic-pkgbuild
AUR_USER=ab
chown -R ${AUR_USER}:${AUR_USER} .

sudo pacman -Syyu --noconfirm --noprogressbar
sudo -u ${AUR_USER} git config --global user.name "Test User"
sudo -u ${AUR_USER} git config --global user.email "test@example.com"
cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u ${AUR_USER} yay -S --noconfirm --noprogressbar --needed

# Temporary fix (waiting for https://github.com/acxz/pkgbuilds/issues/161)
pacman -S python-pip --noconfirm --noprogressbar
pip3 install colcon-core==0.7.0
# Temporary fix (https://github.com/m2-farzan/ros2-galactic-PKGBUILD/issues/9)
wget -O python-pyqt5-5.15.5-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/p/python-pyqt5/python-pyqt5-5.15.5-1-x86_64.pkg.tar.zst
pacman -U python-pyqt5-5.15.5-1-x86_64.pkg.tar.zst --noconfirm --noprogressbar

sudo -u ${AUR_USER} makepkg
