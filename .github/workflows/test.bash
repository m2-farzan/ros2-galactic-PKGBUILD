#!/bin/bash
cd /ros2-galactic-pkgbuild
AUR_USER=ab
sudo pacman -Syyu --noconfirm --noprogressbar
git config --global user.name "Test User"
git config --global user.email "test@example.com"
cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u ${AUR_USER} yay -S --noconfirm --noprogressbar --needed
sudo -u ${AUR_USER} makepkg
