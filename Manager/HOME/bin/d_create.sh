#!/bin/sh
#####################################
# DONT GO BLINDLY RUNNING THIS!
#####################################

#FIX DNS FIRST OR USE IP ADDRESSES INSTEAD!

nodes[0]="de01a"
nodes[1]="de01b"
nodes[2]="de02a"
nodes[3]="de02b"
nodes[4]="de03a"
nodes[5]="de03b"

for DE in ${nodes[@]} ; do
  #setup the ssh keys
  ssh-copy-id -i ~/.ssh/dockerengine_rsa dockerengine@$DE
  
  #create the docker engines
  docker-machine create --driver generic --generic-ssh-key ~/.ssh/dockerengine_rsa --generic-ssh-user=dockerengine --generic-ip-address=$DE $DE
done

