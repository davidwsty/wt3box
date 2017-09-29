#!/bin/bash

# Possible init types: DEV, DEPLOY
INITTYPE=${1:-DEV}


######
## Composer install
######
cd dev
echo "installing composer packages..."
if [ "$INITTYPE" == "DEPLOY" ]; then
	cd ../source/ && /usr/bin/php7.0 /usr/local/bin/composer install
	rm .gitignore
else
	vagrant ssh -c "cd /project/source/ && composer install"
	rm ../source/.gitignore
fi