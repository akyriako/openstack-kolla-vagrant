#!/bin/bash

echo ">>> INSTALL DEPENDENCIES"

sudo apt-get update
sudo apt-get install git python3-dev libffi-dev gcc libssl-dev -y

echo ">>> INSTALL DEPENDENCIES FOR VIRTUAL ENVIRONMENT"

sudo apt-get install python3-venv -y 

python3 -m venv /home/vagrant/venv
source /home/vagrant/venv/bin/activate

pip install -U pip

echo ">>> INSTALL ANSIBLE"

pip install 'ansible>=6,<8'

echo ">>> INSTALL KOLLA-ANSIBLE"

pip install git+https://opendev.org/openstack/kolla-ansible@master

sudo mkdir -p /etc/kolla
sudo chown $USER:$USER /etc/kolla

cp -r /home/vagrant/venv/share/kolla-ansible/etc_examples/kolla/* /etc/kolla
cp /home/vagrant/venv/share/kolla-ansible/ansible/inventory/all-in-one /etc/kolla

echo ">>> INSTALL ANSIBLE GALAXY DEPENDENCIES"

source /home/vagrant/venv/bin/activate
kolla-ansible install-deps


