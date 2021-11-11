FROM ghcr.io/greyltc-org/archlinux-aur:yay
ARG AUR_USER=ab

RUN pacman -Syyu --noconfirm --noprogressbar

RUN sudo -u $AUR_USER git config --global user.name "Test User"
RUN sudo -u $AUR_USER git config --global user.email "test@example.com"

COPY --chown=$AUR_USER . /ros2-pkg

USER $AUR_USER
WORKDIR /ros2-pkg
RUN mkdir src artifact

USER root

RUN cat .SRCINFO | grep -oP "depends\ \=\ \K.+" | xargs sudo -u $AUR_USER yay -S --noconfirm --noprogressbar --needed

CMD [ "bash", "-c", "chown -R ab:ab /ros2-pkg && sudo -u ab env PKGDEST=/ros2-pkg/artifact makepkg" ]
