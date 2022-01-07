#!/bin/bash

cd /ros2-galactic-pkgbuild
AUR_USER=ab
chown -R ${AUR_USER}:${AUR_USER} .

sudo pacman -Syyu --noconfirm --noprogressbar
sudo -u ${AUR_USER} git config --global user.name "Test User"
sudo -u ${AUR_USER} git config --global user.email "test@example.com"
cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u ${AUR_USER} yay -S --noconfirm --noprogressbar --needed
sudo -u ${AUR_USER} makepkg
