#!/bin/bash


######
## Composer install
######
cd dev
echo "installing composer packages..."
vagrant ssh -c "cd /project/source/ && composer install"
rm ../source/.gitignore