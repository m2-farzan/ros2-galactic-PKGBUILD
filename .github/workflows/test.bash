#!/bin/bash
cd /ros2-galactic-pkgbuild
sudo pacman -Syyu --noconfirm --noprogressbar
git config --global user.name "Test User"
git config --global user.email "test@example.com"
cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo yay -S --noconfirm --noprogressbar --needed
makepkg
