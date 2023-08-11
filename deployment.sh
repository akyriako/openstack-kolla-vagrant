#!/bin/bash

echo ">>> DEPLOYMENT"

source /home/vagrant/venv/bin/activate

kolla-ansible -i /etc/kolla/all-in-one bootstrap-servers
kolla-ansible -i /etc/kolla/all-in-one prechecks
kolla-ansible -i /etc/kolla/all-in-one deploy
