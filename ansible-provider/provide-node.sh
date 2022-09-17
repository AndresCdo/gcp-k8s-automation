#!/bin/bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

sudo apt-get update
sudo apt-get install -y docker-ce=17.06.0~ce-0~ubuntu kubeadm=1.13.4-00 kubectl=1.13.4-00 kubelet=1.13.4-00 kubernetes-cni=0.6.0-00
