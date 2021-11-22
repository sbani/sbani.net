#/bin/bash

hugo

rsync -avP --delete public/* h4:/var/www/netw0rkio/

