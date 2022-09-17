#!/bin/bash

bash node-list.sh && sleep 3 && ansible-playbook -i inventory.txt --private-key ~/.ssh/kubernetes-lab-ssh-key --ssh-extra-args "-o 'StrictHostKeyChecking no'" -u andres playbook.yml

