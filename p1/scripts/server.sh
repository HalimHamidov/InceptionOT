#!/bin/bash

# Turn off firewalld just for educational goals
sudo systemctl disable firewalld.service --now

# for ifconfig and other settings of net
sudo yum update
sudo yum upgrade
sudo yum -y install net-tools

# Install k3s
export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"

 # to set rights for configure k3s
echo K3S_KUBECNFIG_MODE=\"644\" >> /etc/systemd/system/k3s.service.env
# or
export K3S_KUBECONFIG_MODE="644"

curl -sfL https://get.k3s.io | sh -


