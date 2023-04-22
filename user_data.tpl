#!/bin/bash
apt-get update
apt-get install -y docker.io
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
cat <<'DOCKER_COMPOSE_YML' > /home/ubuntu/docker-compose.yml
${docker_compose_yml}
DOCKER_COMPOSE_YML
cd /home/ubuntu/
docker-compose -f /home/ubuntu/docker-compose.yml up -d
