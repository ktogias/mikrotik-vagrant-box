Vagrant.configure("2") do |config|
  
  # Configuration for mikrotik VM
  config.vm.define "mikrotik" do |mikrotik|
    # RouterOS has a custom shell that is not compatible with vagrant commands, so we disable ssh.shell
    mikrotik.ssh.shell = ""
    # Vagrant fails to insert the secure keypair due to the RouterOS custom shell, so we leave the 
    # insecure keypair inplace 
    mikrotik.ssh.insert_key = false
    # We use ktogias/mikrotik box from vagrant cloud
    mikrotik.vm.box = "ktogias/mikrotik"
    # ether2 interface configuration 
    mikrotik.vm.network "private_network", 
        libvirt__network_name: "net1", 
        libvirt__forward_mode: "veryisolated", 
        libvirt__dhcp_enabled: false
    # ether3 interface configuration
    mikrotik.vm.network "private_network", 
        libvirt__network_name: "net2", 
        libvirt__forward_mode: "veryisolated", 
        libvirt__dhcp_enabled: false
    # Synced folder setup fails due to RouterOS custom shell, so we disable it
    # We will still get an error for sed command responding with a non-zero exit status, 
    # but the vm boot completes and so we can igrore it
    mikrotik.vm.synced_folder '.', '/vagrant', disabled: true
    # ether1 interface is used for the management network that is by default NATed for internet access.
    # We have to use the specific mac address used when RouterOS VM was installed 
    # and on witch dhcp client is enabled. 
    # If not the vm will skip ether1 and use ether2 with no dhcp client for management network 
    # failing to obtain an ip on boot 
    mikrotik.vm.provider :libvirt do |libvirt|
      libvirt.management_network_mac = "52:54:00:ea:f2:ee"
    end
  end

end
