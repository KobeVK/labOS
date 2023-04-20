#!/bin/bash

# Update package list
sudo apt-get update

# Install Python 3.9
sudo apt-get install -y python3.9

# Install Docker
sudo apt-get install -y docker.io

# Install Docker Compose
sudo apt-get install -y docker-compose

# Install Terraform client
wget https://releases.hashicorp.com/terraform/1.0.9/terraform_1.0.9_linux_amd64.zip
sudo apt install unzip
unzip terraform_1.0.9_linux_amd64.zip
sudo mv terraform /usr/local/bin/

# Install pip
sudo apt-get install -y python3-pip
sudo apt install python3-django

#install requirments
pip install requests
