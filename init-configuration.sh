#!/bin/bash

echo ">>> PREPARE INITIAL CONFIGURATION"

source /home/vagrant/venv/bin/activate

kolla-genpwd

envsubst < /vagrant/globals.yml.tpl >> /vagrant/globals.yml
cp /vagrant/globals.yml /etc/kolla/globals.yml 
rm /vagrant/globals.yml


