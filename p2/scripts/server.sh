#!/bin/bash

# Turn off firewalld
sudo systemctl disable firewalld.service --now

# Install k3s

# set constant for static IP
export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"
# set rights for change kubeconfig (like chmod codes)
export K3S_KUBECONFIG_MODE="644"

# install docker to virtual machine
curl https://releases.rancher.com/install-docker/19.03.sh | sh

# downloading installation package of k3s
# flags -L mean --location this option will make curl redo the request on the new place
# --silent mean don't output anything (include logs)
# -f this enables uploading of binary files

curl -sfL https://get.k3s.io | sh -s - --docker


# Completion
# write kubectl completion bash is usefull command which could help find commands of kubectl
# alias kubectl is for shortcut
# third command is set start command kubectl like 'k', not like 'kubectl'
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'alias k=kubectl' >> ~/.bashrc
echo 'complete -F __start_kubectl k' >> ~/.bashrc
