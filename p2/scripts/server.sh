#!/bin/bash
yum update
yum upgrade
# Turn off firewalld
sudo systemctl disable firewalld.service --now

# Install k3s

# set constant for static IP
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $1 --node-ip $1 --flannel-iface=eth1"
curl -sfL https://get.k3s.io |  sh -


# set constant rights for change kubeconfig (like chmod codes)
export K3S_KUBECONFIG_MODE="644"
echo "alias k='k3s kubectl'" >> /etc/profile.d/00-aliases.sh

sudo yum install net-tools -y


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
echo 'alias k=/usr/local/bin/kubectl' >> ~/.bashrc
echo 'complete -F __start_kubectl k' >> ~/.bashrc

# This 3 one's have configurations for install containers in kubernetes
/usr/local/bin/kubectl create configmap app1-html --from-file /media/configs/app1/index.html
/usr/local/bin/kubectl apply -f /media/configs/app1/deployment.yaml

/usr/local/bin/kubectl create configmap app2-html --from-file /media/configs/app2/index.html
/usr/local/bin/kubectl apply -f /media/configs/app2/deployment.yaml

/usr/local/bin/kubectl create configmap app3-html --from-file /media/configs/app3/index.html
/usr/local/bin/kubectl apply -f /media/configs/app3/deployment.yaml

/usr/local/bin/kubectl wait --for=condition=complete --timeout=300s -n kube-system job.batch/helm-install-traefik-crd
sleep 3

# kubectl apply -f /vagrant/confs/ingressroute.yaml
