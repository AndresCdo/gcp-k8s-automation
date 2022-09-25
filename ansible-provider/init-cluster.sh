#!/bin/bash

echo "Initializing Kubernetes Cluster...";
master_node=$(gcloud compute instances list | grep master | awk '{ print $((NF - 1)) }');
worker_node_list=($(gcloud compute instances list | grep worker | awk '{ print $((NF - 1)) }'));
echo "Master node IP: $master_node";
echo "Worker node IPs: ${worker_node_list[@]}";
echo '';
sleep 5;

user="ubuntu";
hash_join_node=$(ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=stable-1.13 | tail -n 3 | sed '/^[[:space:]]*$/d' | cat -");
sleep 5;

echo '';
echo "The followin is the master node hash for join workers: ";
echo '';
echo $hash_join_node;
echo '';

ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo mkdir -p $HOME/.kube";
ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config";
ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo chown $(id -u):$(id -g) $HOME/.kube/config";
ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml";
ssh -i ~/.ssh/kubernetes-lab-ssh-key $user@$master_node -o 'StrictHostKeyChecking no' "sudo kubectl apply -f https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')";
sleep 5;

for node in ${worker_node_list[@]}; do
    ssh -i ~/.ssh/kubernetes-lab-ssh-key -o "StrictHostKeyChecking no" $user@$node "sudo $hash_join_node";
done
