#!/bin/bash
apt-get update
apt-get install -y docker.io
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# cat <<'DOCKER_COMPOSE_YML' > /home/ubuntu/docker-compose.yml
# ${docker_compose_yml}
# DOCKER_COMPOSE_YML

#cloning the repo
sudo yum update -y
sudo yum install -y git
sudo git clone https://github.com/KobeVK/labOS.git
cd /home/ubuntu/labOS
sudo docker-compose -f /home/ubuntu/labOS/docker-compose.yml up -d
