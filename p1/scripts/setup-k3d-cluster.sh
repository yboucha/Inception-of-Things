#!/bin/bash
# p1/scripts/setup-k3d-cluster.sh
# Creates a 2-node K3d cluster simulating Server + Worker

set -e

echo "=== Creating K3d Cluster for Part 1 ==="

# Create cluster with 2 nodes (1 server, 1 agent)
k3d cluster create inception-cluster \
  --api-port 6443 \
  --servers 1 \
  --agents 1 \
  --port "8080:80@loadbalancer" \
  --wait

echo "=== Cluster Created ==="
kubectl cluster-info
kubectl get nodes

echo ""
echo "=== Node Details ==="
kubectl get nodes -o wide

echo ""
echo "=== To simulate the Vagrant requirement: ==="
echo "Server Node: k3d-inception-cluster-server-0"
echo "Worker Node: k3d-inception-cluster-agent-0"
echo ""
echo "Use 'kubectl get nodes' to see both nodes"
