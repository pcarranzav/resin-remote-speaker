FROM resin/rpi-node

RUN apt-get update && apt-get install -y dropbear usbutils wireless-tools sudo

ADD start /start
ADD src/ /src
ADD syncthing-linux-arm-v0.10.30.tar.gz /
RUN mv syncthing-linux-arm-v0.10.30 syncthing

#RUN /syncthing/syncthing -generate="/syncthing/syncthingHome"

RUN chmod a+x /start

RUN cd /src && npm install

EXPOSE 8080

CMD bash /start
