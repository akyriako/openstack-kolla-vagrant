#!/bin/bash

echo ">>> POST-DEPLOYMENT"

source /home/vagrant/venv/bin/activate

pip install python-openstackclient -c https://releases.openstack.org/constraints/upper/master
kolla-ansible post-deploy
/home/vagrant/venv/share/kolla-ansible/init-runonce
