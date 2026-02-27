#!/bin/bash
set -e

echo "=== Installing K3s ==="

# Update system
sudo apt-get update
sudo apt-get upgrade -y

# Install K3s
curl -sfL https://get.k3s.io | sh -

# Wait for K3s
sleep 20

# Verify
sudo systemctl status k3s --no-pager

# Setup kubectl for vagrant user
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kubeconfig
sudo chown vagrant:vagrant /home/vagrant/.kubeconfig
echo "export KUBECONFIG=/home/vagrant/.kubeconfig" >> /home/vagrant/.bashrc

# Install kubectl if needed
sudo apt-get install -y kubectl || true

echo "=== K3s installed successfully ==="
