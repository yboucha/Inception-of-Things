#!/bin/bash
echo "=== Deploying Part 2 ==="

# Start VM
echo "1. Starting VM..."
vagrant up

echo -e "\n2. SSH into VM and run tests..."
vagrant ssh -c "sudo /vagrant/scripts/test-part2.sh"

echo -e "\n3. Instructions for testing from host:"
echo "Add to your hosts file (Windows: C:\Windows\System32\drivers\etc\hosts):"
echo "192.168.56.110 app1.com"
echo "192.168.56.110 app2.com"
echo ""
echo "Then open browser to:"
echo "- http://app1.com"
echo "- http://app2.com"
echo "- http://192.168.56.110 (default app)"
