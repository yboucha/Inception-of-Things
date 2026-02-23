#!/bin/bash
set -eux

# Update and install dependencies
sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https

# Wait for the server token to be available
while [ ! -f /vagrant/scripts/k3s_token ]; do
  sleep 2
done
K3S_TOKEN=$(cat /vagrant/scripts/k3s_token)

# Install K3s agent and join the server
#“Connect to Kubernetes server at 192.168.56.110, port 6443.”
#Port 6443 = Kubernetes API port.
curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" K3S_TOKEN="$K3S_TOKEN" sh -s - agent --node-name sel-jamaSW
