#!/bin/bash

# Get node-token Chmod 600 (chmod a+rwx,u-x,g-rwx,o-rwx) sets permissions so that, (U)ser / owner can read, can write and can't execute. (G)roup can't read, can't write and can't execute. (O)thers can't read, can't write and can't execute.
chmod 600 ~/private_key

#the following entry generates private_key in the user's ~/private_key directory
#exchange ssh private keys for kube and remove private key for security
#reading An Introduction To Shell Programming and https://www.unix.com/
# if [$? -eq 0]  The whole line means  'if the previous return code was equal to 0 ' ....
while true
do
  TOKEN=$(ssh -i ~/private_key -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no vagrant@$MASTER_SERVER_IP "sudo cat /var/lib/rancher/k3s/server/node-token")
  if [ $? -eq 0 ]
  then
      break
  fi
  echo "Sleep 10"
  sleep 10
done
# Remove
rm ~/private_key

echo "TOKEN = $TOKEN"

# Turn off firewalld just for educational goals
sudo systemctl disable firewalld.service --now

# for ifconfig
sudo yum -y install net-tools

# Install k3s
export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"
export K3S_URL="https://$MASTER_SERVER_IP:6443"
export K3S_TOKEN=$TOKEN
#
curl -sfL https://get.k3s.io | sh -
