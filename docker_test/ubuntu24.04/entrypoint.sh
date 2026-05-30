#!/bin/bash
apt update
apt install -y ansible ca-certificates gnupg
cd /setup
source ./secrets.sh

echo "Running Ansible playbook: $PLAYBOOK"
sleep 2
IS_DOCKER=true ansible-playbook -i inventory.ini -l localhost playbooks/$PLAYBOOK.yml
docker ps

while true; do sleep 1000; done