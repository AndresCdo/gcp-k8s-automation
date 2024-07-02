#!/bin/bash

bash node-list.sh

master_node=$(gcloud compute instances list | grep master | awk '{ print $((NF - 1)) }')
# scp -i ~/.ssh/kubernetes-lab-ssh-key -o 'StrictHostKeyChecking no' ~/.ssh/kubernetes-lab-ssh-key andres@$master_node:~/.ssh
# scp -i ~/.ssh/kubernetes-lab-ssh-key -o 'StrictHostKeyChecking no' inventory.ini playbook.yml harden-new-system.yml andres@$master_node:~

sleep 3 

ansible-playbook -i inventory.ini --private-key ~/.ssh/kubernetes-lab-ssh-key --ssh-extra-args '-o "StrictHostKeyChecking no"' -u andres playbook.yml

