# Update or create the Node 1 setup script with ONOS Docker deployment
node1_script_path = "/mnt/data/node1-orchestrator-setup.sh"

onos_script = """#!/bin/bash
# Node 1 Setup Script: Slice Orchestrator + ONOS Controller

echo "[INFO] Updating system packages..."
sudo apt update -y

echo "[INFO] Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "[INFO] Pulling and running ONOS Docker container..."
sudo docker run -d \\
  --name onos \\
  -p 8181:8181 -p 8101:8101 -p 6653:6653 \\
  onosproject/onos

echo "[INFO] ONOS started. Access it via:"
echo "  Web UI: http://192.168.56.11:8181/onos/ui"
echo "  Username: onos | Password: rocks"
"""

# Write to file
with open(node1_script_path, "w") as f:
    f.write(onos_script.strip())

node1_script_path
