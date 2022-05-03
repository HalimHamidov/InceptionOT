#!/usr/bin/env bash

# cluster
k3d cluster create mycluster --servers 1 --agents 0 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer" -p "8082:8082@loadbalancer" -p "8081:8081@loadbalancer"

# namespace
kubectl create namespace argocd
kubectl create namespace dev
kubectl create namespace gitlab

curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | sed -e 's/\( *\)- argocd-server/&\n\1- --insecure/' | kubectl apply -n argocd -f -
sleep 3
kubectl apply -f /vagrant/confs/ingress.yaml
kubectl apply -f /vagrant/confs/gitlab.yaml
kubectl apply -f /vagrant/confs/argo_gitlab.yaml
