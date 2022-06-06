FROM fragsoc/steamcmd-wine-xvfb

COPY start.sh /usr/bin/start.sh

RUN useradd --shell /bin/bash --create-home steam && \
  chmod +x /usr/bin/start.sh && \
  mkdir -p /{data,server} && \
  chown -R steam:steam /{data,server}

USER steam

WORKDIR /home/steam

ENV HOME /home/steam
ENV UPDATE_SERVER true
ENV SERVER_DIR /server
ENV DATA_DIR /data

EXPOSE 27015/udp
EXPOSE 27016/udp

ENTRYPOINT start.sh