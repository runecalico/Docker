#!/bin/sh

# Prepare to install Docker CE
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"


# Install Docker CE
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce-1
sudo apt-get install docker-ce
