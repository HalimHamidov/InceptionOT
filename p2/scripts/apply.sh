#!/bin/bash

# This 3 one's have configurations for install containers in kubernetes
kubectl apply -f /vagrant/confs/app1.yaml
kubectl apply -f /vagrant/confs/app2.yaml
kubectl apply -f /vagrant/confs/app3.yaml
# for an IngressRoute type which help us to have external connection
# kubectl wait is confirm that all configs has applied and take time for install traefik-crd plug from helm for configure ingress proxy
kubectl wait --for=condition=complete --timeout=300s -n kube-system job.batch/helm-install-traefik-crd
sleep 3
#kubectl apply -f /vagrant/confs/ingressroute.yaml
