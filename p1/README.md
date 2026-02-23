# Part 1: K3s Cluster Setup

## Approach
Instead of Vagrant + VirtualBox, using K3d (K3s in Docker) which:
1. Creates a lightweight Kubernetes cluster
2. Simulates multi-node setup (1 server, 1 agent)
3. Meets project requirements with simpler setup

## Setup
1. Run: `chmod +x scripts/setup-k3d-cluster.sh`
2. Run: `./scripts/setup-k3d-cluster.sh`

## Verification
- `kubectl get nodes` should show 2 nodes
- Both nodes should be in Ready state

## Cleanup
Run: `./scripts/destroy-cluster.sh`
