
# разворавичаем кластер
sudo k3d cluster create mycluster --servers 1 --agents 0 -p "8080:80@loadbalancer" -p "8888:8888@loadbalancer"

# создаем namespace argocd И dev
kubectl create namespace argocd
kubectl create namespace dev
echo 'ArgoCD и Dev созданы'

# for an IngressRoute type
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml | sed -e 's/\( *\)- argocd-server/&\n\1- --insecure/' | kubectl apply -n argocd -f -
sleep 3
sudo kubectl apply -f confs/argo.yaml -n argocd
sudo kubectl apply -n argocd -f confs/ingress.yaml 