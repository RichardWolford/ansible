
# needs run as sudo
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
rpm -ivh epel-release-7-9.noarch.rpm

# delete the RPM
rm epel-release-7-9.noarch.rpm -f

yum install ansible -y
yum install git -y

yum update -y

if [! -f "/root/.ssh/id_rsa"]; then
	ssh-keygen -t rsa -b 4096 -C "rwolford@ansible" -N "" -f "/root/.ssh/id_rsa"
fi

# clone ansible repository
if [! -d "/root/.ssh/id_rsa"]; then
	mkdir /etc/ansible/git
	git clone https://github.com/RichardWolford/ansible.git /etc/ansible/git/
	
else
	cd /etc/ansible/git
	git pull origin master	
fi

# copy the key to the ansible hosts
# ssh-copy-id rwolford@10.0.1.4