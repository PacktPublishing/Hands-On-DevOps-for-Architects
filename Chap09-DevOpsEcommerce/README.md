# Hands-On-DevOps-for-Architects
# The code for this repository is under development

Download and install Vagrant (which on Windows requires Oracle Virtual box)
https://www.vagrantup.com/downloads.html

Place the Vagrantfile into a an empty directory and then issue the vagrant up
command. Once the vagrant environment is provisioned you connect to the node we
will use as an Ansible controller (which we call ansctl).

We connect the Ansible controller node:
vagrant ssh ansctl

From the ansible node we can install Ansible
sudo apt-get -y update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -y update
sudo apt-get -y install ansible

You can use the ssh-keygen command to create your private/public keypair which
we will then use to connect to the other nodes.
https://www.ssh.com/ssh/keygen/

ssh-keygen and accept all defaults

You can then copy your public key to the target machines:
ssh-copy-id -i ~/.ssh/mykey user@host
https://www.ssh.com/ssh/copy-id
