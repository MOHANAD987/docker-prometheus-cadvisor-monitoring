#!/bin/bash

# 1. Configure daemon.json to enable Docker metrics
echo "Configuring Docker daemon metrics..."
sudo bash -c 'cat <<EOF > /etc/docker/daemon.json
{
  "metrics-addr" : "0.0.0.0:9323",
  "experimental" : true
}
EOF'

# Note: 127.0.0.1 was changed to 0.0.0.0 to allow access to metrics from outside the server.

# 2. Restart Docker service to apply changes
echo "Restarting Docker service..."
sudo systemctl restart docker

# 3. Create and run cAdvisor container
echo "Deploying cAdvisor container..."
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  ghcr.io/google/cadvisor:latest

echo "--------------------------------------------------"
echo "cAdvisor is now running on port 8080!"
echo "Docker metrics are enabled on port 9323."
echo "--------------------------------------------------"
