FROM ghcr.io/greyltc-org/archlinux-aur:yay
ARG AUR_USER=ab

RUN printf "Server = http://127.0.0.1:8000\n$(cat /etc/pacman.d/mirrorlist)" > /etc/pacman.d/mirrorlist

RUN cat /etc/pacman.d/mirrorlist

RUN pacman -Syyu --noconfirm --noprogressbar

RUN sudo -u $AUR_USER git config --global user.name "Test User"
RUN sudo -u $AUR_USER git config --global user.email "test@example.com"

COPY --chown=$AUR_USER . /ros2-pkg

WORKDIR /ros2-pkg

RUN cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u $AUR_USER yay -S --noconfirm --noprogressbar --needed

# Adress PyQt5 issue
RUN pacman -S --noconfirm --noprogressbar --needed python-pyqt5
RUN mkdir -p /usr/share/sip
RUN ln -sf /usr/lib/python3.9/site-packages/PyQt5 /usr/share/sip/.
RUN ln -sf /usr/lib/python3.9/site-packages/PyQt5/bindings/* /usr/share/sip/PyQt5/.

RUN sudo -u $AUR_USER makepkg -i --noconfirm

RUN printf "\nexport ROS_DOMAIN_ID=42\nsource /opt/ros2/galactic/setup.bash\n" >> ~/.bashrc

CMD [ "bash", "-c", "'source ~/.bashrc && ros2'" ]
