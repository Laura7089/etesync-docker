FROM python:3.8

# copy in and install the app
COPY etesync-server /app
COPY run.sh /run.sh
RUN chmod 0755 /run.sh
WORKDIR /app
RUN pip install -r requirements.txt

# setup basic configuration and directories
RUN mkdir -p /etc/etebase-server /srv/etebase-server /var/etebase-server
COPY etebase-server.ini.example /etc/etebase-server/etebase-server.ini

EXPOSE 8000/tcp
# static+data volumes
VOLUME /srv/etebase-server
VOLUME /var/etebase-server

ENTRYPOINT "/run.sh"
