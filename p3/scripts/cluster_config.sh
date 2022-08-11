#!/usr/bin/env bash

# cluster
k3d cluster create mycluster --servers 1 --agents 0 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer"

# namespace
kubectl create namespace argocd
kubectl create namespace dev

# Add access to vagrant for use our cluster via copy configs of root to user vagrant
cp -r /root/.kube ../../home/vagrant/
sudo chmod 777 /home/vagrant/.kube/config

# for an IngressRoute type
# In Deployment set insecure for switch off firewall and apply configs to kubernetes.
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | sed -e 's/\( *\)- argocd-server/&\n\1- --insecure/' | kubectl apply -n argocd -f -
# for wait process of applying
sleep 10
kubectl apply -f /vagrant_config_files/confs/ingress.yaml
kubectl apply -f /vagrant_config_files/confs/argo.yaml