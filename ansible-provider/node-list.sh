#!/bin/bash

node_list=($(gcloud compute instances list | awk '{ print $5 }' | cat -))

FILE="inventory.txt"
if [[ -f "$FILE" ]]; then
    for node in ${node_list[@]:1}
    do
       ssh-keygen -f "$HOME/.ssh/known_hosts" -R $node
    done

    dd if=/dev/null of=$FILE

    for node in ${node_list[@]:1}
    do
       echo $node >> $FILE
    done
else
    touch $FILE
    for node in ${node_list[@]:1}
    do 
       echo $node >> $FILE
    done
fi

sleep 3
#echo ${node_list[@]:1} | cat -
#for node in ${node_list[@]:1}
#do	
#	ssh -i ~/.ssh/kubernetes-lab-ssh-key andres@"$node" 'bash -s' < provide-node.sh
#done
