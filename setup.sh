#!/bin/sh

# This script was run after installing vm from RouterOS iso

# Enable dhcp on ether1 interface. Needed to get ip from management network.
ip dhcp-client add interface=ether1 disabled=no

# Enable ssh. Needed to be able to ssh to the vm.
ip service enable ssh

# Fetch vagrant insecure default public key. Needed for vagrant to ssh into the vm.
tool fetch url="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub" mode=https dst-path="vagrant.pub"

# Create vagrant user. Needed for vagrant to ssh into the vm.
user add name=vagrant password=vagrant group=full

# Import vagrant insecure public key to user vagrant. Needed for vagrant to ssh into the vm.
user ssh-keys import public-key-file=vagrant.pub user=vagrant
