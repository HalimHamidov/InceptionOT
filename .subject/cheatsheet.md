
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

* p2 *

ln -s goinfre/vagrant/ .vagrant.d

lrwxr-xr-x   1 apearl  student    16 Aug  7 13:50 .vagrant.d -> goinfre/vagrant/
https://chrome.google.com/webstore/detail/modheader/idgpnmonknjnojddfkpgkljpfnnfcklj?hl=ru


kubectl get nodes -o wide
kubectl get all -n kube-system
kubectl get all 
curl -H "Host:app2.com" 192.168.57.110
    1  kubectl describe ingress
    2  sudo journalctl -u k3s | tail -n 20
    3  k get ingress
    4  k get svc

   10  curl -H "Host:app1.com" 192.168.57.110 | grep LOCAL
   11  curl -H "Host:app2.com" 192.168.42.110 | grep LOCAL
   12  curl -H "Host:app3.com" 192.168.42.110 | grep LOCAL
   13  curl -H "Host:app3.com" 192.168.42.110 
   14  curl -H "Host:app2.com" 192.168.42.110
   15  curl -H "Host:app3.com" 192.168.42.110
   16  curl -H "Host:app1.com" 192.168.42.110
curl -H "Host:app1.com" 192.168.42.110 | grep LOCAL
curl -H "Host:app1.com" 192.168.56.110 | grep LOCAL 

http://192.168.56.110/applications?proj=&sync=Synced&health=&namespace=&cluster=&labels=



QUESTIONS:

https://disk.yandex.ru/d/yamzBDGluAHF3Q/1.mp4

Короче через сайт не заходит на app1.com app2.com и по умолчанию app3.com
еще не решена!
[Help] Can't connect to k3s from outside network

https://github.com/k3d-io/k3d/issues/36



Полезные ссылки 

https://www.youtube.com/c/PowerCertAnimatedVideos

server: https://127.0.0.1:6443

vagrant@apearlS:/$ cd vagrant/
vagrant@apearlS:/vagrant$ ls
Vagrantfile  confs  scripts
vagrant@apearlS:/vagrant$ cd confs/
vagrant@apearlS:/vagrant/confs$ ls
argo.yaml  ingress.yaml  manifests
vagrant@apearlS:/vagrant/confs$ kubectl apply -f ingress.yaml 
Error from server (NotFound): the server could not find the requested resource
vagrant@apearlS:/vagrant/confs$ kubectl apply -f ingress.yaml -n dev
Error from server (NotFound): the server could not find the requested resource
vagrant@apearlS:/vagrant/confs$ kubectl apply -f ingress.yaml 
Error from server (NotFound): the server could not find the requested resource
vagrant@apearlS:/vagrant/confs$ Connection to 127.0.0.1 closed by remote host.
Connection to 127.0.0.1 closed.
apearl@at-g5 p3 % 