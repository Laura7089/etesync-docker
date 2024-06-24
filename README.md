# Etesync Docker Image

Build files for the [Etesync Server](https://github.com/etesync/server).
This is a relatively simple setup.

## Usage

```bash
docker build -t laura7089/etesync .
docker run -p 8000:8000
```

You should refer to the [upstream production setup guide](https://github.com/etesync/server/wiki/Production-setup-using-Nginx) once you have confirmed the image works.

An example `docker-compose.yml` file (with accompanying nginx config) is included with this repo, but should not be considered production-ready.

### Configuration

The "easy" configuration file from upstream is modified here and mounted at `/etc/etebase-server/etebase-server.ini` by default; override this if you wish.

- Static files are created at start in the volume at `/srv/etebase-server`
- Data files are stored in the volume at `/var/etebase-server`
- The image will serve at `8000` on TCP

The image requires [Docker BuildKit](https://docs.docker.com/go/buildkit/) to build.
