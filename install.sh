#!/bin/bash
# Purpose: Install ansible and run playbook

echo "Installing Ansible Prerequisites"
sudo easy_install pip

echo "Installing Ansible"
sudo pip install ansible

echo "Executing Mac Setup playbook"
ansible-playbook -i ./hosts playbook.yml --verbose