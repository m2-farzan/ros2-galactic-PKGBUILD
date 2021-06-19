FROM oblique/archlinux-yay

RUN printf "Server = http://127.0.0.1:8000\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

RUN cat /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm --noprogressbar

RUN pacman -S --noconfirm --noprogressbar git
RUN sudo -u aur git config --global user.name "Test User"
RUN sudo -u aur git config --global user.email "test@example.com"

COPY --chown=aur . /ros2-pkg

WORKDIR /ros2-pkg

RUN cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u aur yay -S --noconfirm --noprogressbar

RUN sudo -u aur makepkg -i --noconfirm

RUN printf "\nexport ROS_DOMAIN_ID=42\nsource /opt/ros2/galactic/setup.bash\n" >> ~/.bashrc

CMD [ "bash", "-c", "'source ~/.bashrc && ros2'" ]
