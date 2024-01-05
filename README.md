# mikrotik-vagrant-box

This is a Vagrantfile and documentation for ktogias/mikrotik MikroTik RouterOS Vagrant Box (https://app.vagrantup.com/ktogias/boxes/mikrotik).

The box and Vagrantfile currently only support libvirt provider.

## Background

The box was created on a Fedora 39 machine with libvirt, virt-manager, vagrant and vagrant-libvirt installed.

I downloaded the [RouterOS 7.13 x86 iso](https://download.mikrotik.com/routeros/7.13/mikrotik-7.13.iso) from https://mikrotik.com/download and created a new vm with virt-manager with installation from the downloaded iso. I checked "Customize configuration before install" and changed disk bus to "SATA". RouterOS will not install on a VirtIO disk.

After installation I run the commands in `setup.sh` script and shut down the vm with `system shutdown`.

Then I used `create_box.sh` script to create the box.

## Usage

1. Install [vagrant](https://developer.hashicorp.com/vagrant/docs/installation) and [vagrant-libvirt](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html)
2. Clone this repo: `git clone https://github.com/ktogias/mikrotik-vagrant-box.git`
3. `cd mikrotik-vagrant-box`
4. `vagrant up` to start the RouterOS vm
5. `vagrant ssh` to ssh into the RouterOS vm
6. `vargrant destroy` to stop and remove the RouterOS vm

##
Mikrotik, RouterOS and RouterBOARD are trademarks of Mikrotikls SIA