#!/bin/bash

# Install ops agent
curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
sudo bash add-google-cloud-ops-agent-repo.sh --also-install

# Install Docker Daemon
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce
sudo systemctl enable docker
sudo systemctl start docker

# Install QuakJS Docker Container
sudo docker pull treyyoder/quakejs:latest

PUBLIC_UP=`curl --silent http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H 'Metadata-Flavor: Google'`

# Run QuakeJS Docker Container
sudo docker run -d --name quakejs -e SERVER=$PUBLIC_IP -e HTTP_PORT=80 -p 80:80 -p 27960:27960 treyyoder/quakejs:latest