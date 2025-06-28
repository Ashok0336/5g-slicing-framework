Vagrant.configure("2") do |config|
  config.vm.define "node1-orchestrator" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "slice-orchestrator"
    node.vm.network "private_network", ip: "192.168.56.11"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
    end
    node.vm.provision "shell", path: "node1-orchestrator/scripts/setup.sh"
  end

  config.vm.define "node2-oai-core" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "oai-core"
    node.vm.network "private_network", ip: "192.168.56.12"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "6144"
      vb.cpus = 2
    end
    node.vm.provision "shell", path: "node2-oai-core/scripts/setup.sh"
  end

  config.vm.define "node3-ueransim-monitor" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "ueransim-monitor"
    node.vm.network "private_network", ip: "192.168.56.13"
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
    end
    node.vm.provision "shell", path: "node3-ueransim-monitor/scripts/setup.sh"
  end
end
