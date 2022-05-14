cd goinfre/

mkdir .vagrant.d
cd p1
ls
vagrant up

# - to connect with master

vagrant ssh [node name (apearlS, apearlSW)]

# logout from nodes with SSH
cmd+D | logout | exit
# - to connect with worker
vagrant ssh apearlSW 

# find information about nodes
kubectl get nodes -o wide 
# find IP addresses for check
ifconfig eth1 | grep inet

# find additional information about nodes just in Master node
kubectl describe nodes

    8  kubectl get nodes
    9  kubectl get pods
    kubectl get pods --all-namespaces
# for check hostname
hostname

# for check ip's like ifconfig 
ip a

# check deployments of k3s

kubectl get deploy

# check status of all pods in deployments

kubectl get pods

# check life status of determine active pod

kubectl describe pod app-one-7dbc75dbdf-qfk9j

# for analise namespaces of kubernetes (it's useful when you have several projects and don't want to mix them)

kubectl get ns

ip a | grep eth1
hostname
k get deploy
k get pods
k logs app-one-7dbc75dbdf-pctxf
k describe pod app-one-7dbc75dbdf-pctxf
k get svc
curl -H "Host:app1.com" 192.168.42.110 | grep LOCAL
k get ingress
k get 
http://192.168.56.110/applications?proj=&sync=Synced&health=&namespace=&cluster=&labels=



QUESTIONS:

https://disk.yandex.ru/d/yamzBDGluAHF3Q/1.mp4