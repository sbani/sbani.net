#/bin/bash

hugo

rsync -avP --delete public/* h3:/var/www/netw0rkio/

