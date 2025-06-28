# SDN-Based 5G Network Slicing (3-Node Vagrant Setup)

## 🔧 VM Nodes
- Node 1: Slice Orchestrator + ONOS (192.168.56.11)
- Node 2: OAI 5G Core (AMF, SMF, UPF) (192.168.56.12)
- Node 3: UERANSIM + Prometheus/Grafana (192.168.56.13)

## 🚀 Setup Instructions
1. Clone this repository and go into the directory.
2. Run `vagrant up` to start all 3 nodes.
3. Wait for provisioning to finish. Then SSH into each VM:
   - `vagrant ssh node1-orchestrator`
   - `vagrant ssh node2-oai-core`
   - `vagrant ssh node3-ueransim-monitor`

## 🧠 Components
- **Node 1**: ONOS, Helm, Slice Manager (Layer 1)
- **Node 2**: OAI Core stack via Docker/K8s (Layer 2)
- **Node 3**: gNB + UE via UERANSIM, monitored by Grafana (Layer 3)

## 📈 Metrics
Grafana dashboards available at http://192.168.56.13:3000

## 📁 Structure
- `Vagrantfile`: defines all 3 nodes
- `node*/scripts/setup.sh`: individual setup scripts
- `k8s-deployment/`: contains all Kubernetes manifests

