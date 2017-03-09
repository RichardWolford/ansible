
# needs run as sudo
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
rpm -ivh epel-release-7-9.noarch.rpm

yum update -y

yum install ansible -y

ssh-keygen -t rsa -b 4096 -C "rwolford@ansible" -N "" -f "/root/.ssh/id_rsa"

# copy the key to the ansible hosts
# ssh-copy-id rwolford@10.0.1.4