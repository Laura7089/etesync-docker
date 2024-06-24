#!/bin/sh
set -eu

# adapted from the README at https://github.com/etesync/server/blob/386c01d89e8144e4b0609faa2054c5c83a761742/README.md
./manage.py migrate
./manage.py collectstatic --no-input --clear

uvicorn etebase_server.asgi:application --host 0.0.0.0 --port 8000 "$@"
