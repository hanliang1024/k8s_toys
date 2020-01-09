# wget https://get.helm.sh/helm-v3.0.2-darwin-amd64.tar.gz
# tar zxvf helm-v3.0.2-darwin-amd64.tar.gz
# sudo mv darwin-amd64/helm /usr/local/bin/helm

# helm repo add stable https://kubernetes-charts.storage.googleapis.com

scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@kmaster:/home/vagrant/.kube/config ~/.kube/config

helm install nfs-storage stable/nfs-client-provisioner -n kube-system --set nfs.server=kmaster --set nfs.path=/nfs-share  --set storageClass.name=managed-nfs-storage --set storageClass.defaultClass=true --set storageClass.archiveOnDelete=false
