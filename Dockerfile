FROM resin/rpi-node

RUN apt-get update && apt-get install -y dropbear usbutils wireless-tools sudo pulseaudio pulseaudio-module-zeroconf alsa-utils libasound2-dev

ADD start /start
ADD start_pulseaudio /start_pulseaudio
ADD src/ /src
ADD syncthing-linux-arm-v0.10.30.tar.gz /
RUN mv syncthing-linux-arm-v0.10.30 syncthing

#RUN /syncthing/syncthing -generate="/syncthing/syncthingHome"

RUN chmod a+x /start
RUN chmod a+x /start_pulseaudio

RUN cd /src && npm install

RUN sed -i -e "s@#enable-dbus=yes@enable-dbus=no@" -e "s@#host-name=foo@host-name=$(echo raspberrypi2 | cut -c1-7)@" /etc/avahi/avahi-daemon.conf

RUN useradd -m -G audio pi

EXPOSE 8080
EXPOSE 53

CMD bash /start
