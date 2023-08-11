inventory = "all-in-one" # you can choose between all-in-one or multinode
kolla_base_distro = "ubuntu"
kolla_internal_vip_address = "192.168.59.200"
kolla_external_vip_address = "192.168.1.200"
kolla_external_vip_interface = "enp0s8"
network_interface = "enp0s8"
neutron_external_interface = "enp0s9"
openstack_region_name = "west"
bridge_nic_name = "en0: Wi-Fi"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false
    config.vm.define "operator" do |operator|
      operator.vm.box = "ubuntu/jammy64"
      operator.vm.hostname = "operator.openstack.lab"
      operator.vm.provision :shell, path: "bootstrap.sh", privileged: false
      operator.vm.provision :shell, path: "init-configuration.sh", privileged: false, env: { 
        "kolla_base_distro" => kolla_base_distro, 
        "kolla_internal_vip_address" => kolla_internal_vip_address,
        "kolla_external_vip_address" => kolla_external_vip_address,
        "network_interface" => network_interface,
        "neutron_external_interface" => neutron_external_interface,
        "openstack_region_name" => openstack_region_name
      }
      operator.vm.provision :shell, path: "deployment.sh", privileged: false
      operator.vm.provision :shell, path: "post-deployment.sh", privileged: false
    end
    config.vm.network "private_network", name: "vboxnet3", ip: "192.168.59.200", nic_type: "virtio"
    config.vm.network "public_network", bridge: "#{bridge_nic_name}", ip: "192.168.1.200", nic_type: "virtio"   
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "3072"
      vb.cpus = "1"
      vb.customize ["modifyvm", :id, "--nic1", "nat"]
    end
  end


  