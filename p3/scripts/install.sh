#!/usr/bin/env bash

sudo apt update
sudo apt-get -y upgrade

# Set configs for packages and install docker with dependencies

# set configs for download public keys from docker and used to verify docker packages.
# From Documentation.
sudo apt-get -y install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# Add user vagrant in docker group
sudo gpasswd -a vagrant docker

# Install kubectl for configure k3d

sudo apt-get update
sudo apt-get -y install apt-transport-https
#  Utilize the curl command to get the google cloud SDK package and add the GPG key
# GPG key for encrypt messages and packages and create electronic signs.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get -y install kubectl

# Install k3d

curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# set commands for completion
echo 'source <(k3d completion bash)' >> ~/.bashrc
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'alias k=kubectl' >> ~/.bashrc
# and for start kubectl
echo 'complete -F __start_kubectl k' >> ~/.bashrc