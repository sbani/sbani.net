#/bin/bash
set -xe

DEPLOY_PATH=/var/www/netw0rkio

rm -rf public
hugo

rsync -avP --delete public/ h4:$DEPLOY_PATH

ssh h4 "chown -R caddy:caddy $DEPLOY_PATH"
