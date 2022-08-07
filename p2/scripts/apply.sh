# vagrant файл на одну машину
#$start_script = <<-SCRIPT
# В нем происходит установка кубера k3s и установка net-tools в нашем случае для того чтобы на centos появилась ifconfig который нам позволит узнаать
# что у нас действительно тот ip который заявлен в задании 
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
sudo dnf install centos-release-stream -y
sudo dnf swap centos-{linux,stream}-repos -y
sudo dnf distro-sync -y
sudo yum -y install net-tools # для установки сетевых утилит в том числе ifconfig

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode 644 --flannel-iface eth1" sh - # скачка бинарника, установка флагов и старт через sh
# --write-kubeconfig-mode 644 - Этот флаг разблокирует функцию чтобы можно было сделать k get nodes, что нужно по заданию для того чтобы посмотреть что получился кластер и в нем есть компьютеры
# --flannel-iface eth1 - Означает что у нас будет использоваться в качестве сети для нашего кубернетиса именно eth1, а eth1 это ничто иное как ip 192.168.42.110

# Решаем проблему подключения к кубернетису
sudo chmod 644 /etc/resolv.conf
sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf

# сделаем cubctl конфигурационных файлов которые мы скинули в ходе работы Vagrantfile
/usr/local/bin/kubectl apply -f ./

echo 'alias k="kubectl"' >>./.bashrc # просто alias для того чтобы команты исполнять как написано в сабжекте типа k get nodes -o wide

#SCRIPT