# SDN-Based 5G Network Slicing Framework (3-Node Vagrant Setup)

This repository contains a complete, end-to-end framework to simulate and evaluate a 3-node SDN-enabled 5G network slicing environment using Vagrant, Kubernetes, Docker, ONOS, OAI 5G Core, UERANSIM, and monitoring tools like Prometheus and Grafana.

---

##  Project Overview

The framework is structured into three distinct nodes, each representing a key layer of the network slicing architecture:

| Node | IP Address       | Role                           | Key Components |
|------|------------------|--------------------------------|----------------|
| Node 1 | 192.168.56.11    | Slice Orchestration (Layer 1)  | ONOS SDN Controller, Helm, Slice Manager |
| Node 2 | 192.168.56.12    | 5G Core Network (Layer 2)      | OAI AMF, SMF, UPF, NRF, MySQL |
| Node 3 | 192.168.56.13    | Simulated RAN + Monitoring (Layer 3) | UERANSIM (gNB, UE), Prometheus, Grafana |

---

##  Quick Start

### 1. Prerequisites

- VirtualBox
- Vagrant

### 2. Clone the Repository

```bash
git clone <your-repo-url>
cd 5g-slicing-vagrant-complete
```

### 3. Start the VMs

```bash
vagrant up
```

This will spin up 3 virtual machines and provision basic dependencies.

### 4. SSH into Each Node

```bash
vagrant ssh node1-orchestrator
vagrant ssh node2-oai-core
vagrant ssh node3-ueransim-monitor
```

---

##  Layer Deployment Instructions

### 🟦 Node 1: Slice Orchestrator + ONOS

Deployed via `k8s-deployment/layer1-orchestrator/`:
- `slice-orchestrator.yaml`: REST API for triggering slices
- `onos-controller.yaml`: Deploys ONOS SDN controller
- `helm-server.yaml`: Helm CLI for dynamic service deployment

### 🟩 Node 2: OAI 5G Core

Deployed via `k8s-deployment/layer2-oai-core/`:
- `amf.yaml`, `smf.yaml`, `upf.yaml`, `nrf.yaml`
- `mysql.yaml`: Persistent store for subscriber info

### 🟨 Node 3: UERANSIM + Monitoring

Deployed via `k8s-deployment/layer3-ueransim-monitor/`:
- `ueransim-gnb.yaml`, `ueransim-ue.yaml`: Simulate 5G traffic
- `prometheus.yaml`: Metrics collection
- `grafana.yaml`: Visualization (NodePort 3000)

---

##  Monitoring & Visualization

- Access Grafana UI at: `http://192.168.56.13:3000`
- Default login: `admin / admin`
- View dashboards for:
  - UE Attach Success
  - Slice QoS Metrics
  - Node CPU/Memory per Slice

---

##  Repository Structure

```
5g-slicing-vagrant-complete/
├── Vagrantfile
├── README.md
├── node1-orchestrator/scripts/setup.sh
├── node2-oai-core/scripts/setup.sh
├── node3-ueransim-monitor/scripts/setup.sh
├── k8s-deployment/
│   ├── layer1-orchestrator/
│   ├── layer2-oai-core/
│   └── layer3-ueransim-monitor/
├── docs/
└── results/
```

---

##  Additional Notes

- All components are containerized via Kubernetes for modularity and scalability.
- Slice definition is done via REST + Helm templating from Node 1.
- UERANSIM simulates both control and user plane traffic with realistic session flows.

---

##  Contact / Contribution

Feel free to fork this project, suggest improvements, or adapt it for your academic and industry research.
