#!/bin/bash

# Turn off firewalld just for educational goals
sudo systemctl disable firewalld.service --now

# for ifconfig
sudo dnf -y install net-tools

# Install k3s
export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"
export K3S_KUBECONFIG_MODE="644"

curl -sfL https://get.k3s.io | sh -
