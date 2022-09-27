#!/bin/bash

node_list=($(gcloud compute instances list | awk '{ print $5 }' | cat -))
echo "Master node IP: ${node_list[1]}";
echo "Worker node IPs: ${node_list[@]:2}";
echo "$PWD"

for node in ${node_list[@]:1}
do
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R $node
done

FILE="inventory.txt"
if [[ -f "$FILE" ]]; then
	
    dd if=/dev/null of=$FILE
    
    echo "[master]" >> $FILE;
    echo ${node_list[1]} >> $FILE;
    echo '' >> $FILE;
    echo "[workers]" >> $FILE;
    for node in ${node_list[@]:2}
    do
       echo $node >> $FILE
    done
else
    touch $FILE
    echo "[master]" >> $FILE;
    echo ${node_list[1]} >> $FILE;
    echo '' >> $FILE;
    echo "[workers]" >> $FILE
    for node in ${node_list[@]:2}
    do 
       echo $node >> $FILE
    done
fi

sleep 3

cat $FILE
#echo ${node_list[@]:1} | cat -
#for node in ${node_list[@]:1}
#do	
#	ssh -i ~/.ssh/kubernetes-lab-ssh-key andres@"$node" 'bash -s' < provide-node.sh
#done
