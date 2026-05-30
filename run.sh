#!/bin/bash
sudo apt update
sudo apt install -y ansible ca-certificates gnupg
source ./secrets.sh

echo "Running Ansible playbook: $PLAYBOOK"
sleep 2
ansible-playbook -i inventory.ini -l localhost playbooks/$PLAYBOOK.yml -K
docker ps