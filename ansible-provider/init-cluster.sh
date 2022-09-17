#!/bin/bash

master_node=$(gcloud compute instances list | grep master | awk '{ print $((NF - 1)) }')
hash_join_node=$(ssh -i ~/.ssh/kubernetes-lab-ssh-key andres@$master_node -o 'StrictHostKeyChecking no' "sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=stable-1.13 | tail -n 3 | sed '/^[[:space:]]*$/d' | cat -");

user="andres"
ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -l $user -o 'StrictHostKeyChecking no' "mkdir -p /home/$user/.kube && sudo cp -f /etc/kubernetes/admin.conf /home/$user/.kube/config && sudo chown $user:$user /home/$user/.kube/config | kubectl apply -f 'https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d "\n")'";

echo "The followin is the master node hash for join workers: "
echo $hash_join_node

node_list=($(gcloud compute instances list | grep worker | awk '{ print $((NF - 1)) }'));

for node in ${node_list[@]}; do
    ssh -i ~/.ssh/kubernetes-lab-ssh-key -o "StrictHostKeyChecking no" andres@$node "sudo $hash_join_node";
done
