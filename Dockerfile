FROM python:3.8

ARG ETESYNC_VERSION="v0.14.2"

# copy in and install the app
RUN mkdir -p /app
WORKDIR /app
RUN \
    curl --fail --location \
        "https://github.com/etesync/server/archive/refs/tags/$ETESYNC_VERSION.tar.gz" \
    | tar xzv --directory=/app --strip-components=1
COPY run.sh /run.sh
RUN chmod 0755 /run.sh
RUN pip install -r requirements.txt

# setup basic configuration and directories
RUN mkdir -p /etc/etebase-server /srv/etebase-server /var/etebase-server
COPY etebase-server.ini.example /etc/etebase-server/etebase-server.ini

EXPOSE 8000/tcp
# static+data volumes
VOLUME /srv/etebase-server
VOLUME /var/etebase-server

ENTRYPOINT "/run.sh"
