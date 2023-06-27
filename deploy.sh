#/bin/bash
set -xe

DEPLOY_PATH=/var/www/netw0rkio

rm -rf public
hugo --minify

rsync -avP --delete public/ h5:$DEPLOY_PATH

ssh h5 "chown -R caddy:caddy $DEPLOY_PATH"
