#!/bin/bash

echo ">>> TEST INITIAL CONFIGURATION"

envsubst < /vagrant/globals.yml.tpl >> /vagrant/globals.yml
sudo cp /vagrant/globals.yml etc/kolla/globals.yml 
sudo rm /vagrant/globals.yml

