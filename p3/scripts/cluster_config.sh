#!/usr/bin/env bash

# cluster
k3d cluster create mycluster --servers 1 --agents 0 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer"

echo AAAAAAAAAAAAAA

# namespace
kubectl create namespace argocd
kubectl create namespace dev

# for an IngressRoute type
# In Deployment set insecure for switch off firewall and apply configs to kubernetes.
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | sed -e 's/\( *\)- argocd-server/&\n\1- --insecure/' | kubectl apply -n argocd -f -
# for wait process of applying
sleep 10
kubectl apply -f /vagrant/confs/ingress.yaml
kubectl apply -f /vagrant/confs/argo.yaml