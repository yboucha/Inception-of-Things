#!/bin/bash
set -eux

# Update and install dependencies
sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https

# Install K3s server
curl -sfL https://get.k3s.io | sh -s - server --node-name sel-jamaS

# create kubectl shortcut (symlink to k3s)
sudo ln -sf /usr/local/bin/k3s /usr/local/bin/kubectl

# Allow vagrant user to use kubectl
sudo mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube

# Output K3S token for worker join
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/scripts/k3s_token
