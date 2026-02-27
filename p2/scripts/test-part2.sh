#!/bin/bash
echo "=== Testing Part 2 Setup ==="

echo "1. Checking K3s status..."
sudo systemctl status k3s --no-pager | grep -A 2 "Active:"

echo -e "\n2. Checking deployments..."
sudo kubectl get deployments

echo -e "\n3. Checking pods (app2 should have 3 pods)..."
sudo kubectl get pods -o wide

echo -e "\n4. Checking services..."
sudo kubectl get services

echo -e "\n5. Checking ingress..."
sudo kubectl get ingress

echo -e "\n6. Testing from inside VM (simulating client access)..."
echo "Testing app1.com:"
curl -H "Host: app1.com" http://localhost 2>/dev/null | grep -o "<title>.*</title>" || echo "Failed"
echo ""
echo "Testing app2.com:"
curl -H "Host: app2.com" http://localhost 2>/dev/null | grep -o "<title>.*</title>" || echo "Failed"
echo ""
echo "Testing default (no host):"
curl http://localhost 2>/dev/null | grep -o "<title>.*</title>" || echo "Failed"

echo -e "\n=== Test Complete ==="
