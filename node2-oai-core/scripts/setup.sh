from pathlib import Path

# Define the updated setup.sh script for Node 2 (OAI Core) with OVS and Docker
node2_setup_script = """#!/bin/bash

# Node 2 Setup: OAI 5G Core + Open vSwitch

echo "[INFO] Updating system packages..."
sudo apt update -y

echo "[INFO] Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "[INFO] Installing Open vSwitch..."
sudo apt install -y openvswitch-switch

echo "[INFO] Creating OVS bridge 'br0'..."
sudo ovs-vsctl add-br br0

echo "[INFO] Setting ONOS controller (Node 1) as the OpenFlow controller..."
sudo ovs-vsctl set-controller br0 tcp:192.168.56.11:6653

echo "[INFO] Node 2 OAI Core setup complete. Docker and OVS are now active."
"""

# Write the script to a file
file_path = "/mnt/data/node2-oai-core-setup.sh"
Path(file_path).write_text(node2_setup_script.strip())

file_path
