#!/usr/bin/env bash
# to find secret for access to argocd
sleep 18
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
