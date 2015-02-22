#!/bin/bash

set -e
set -x

mkdir -p /home/root/.ssh
touch /home/root/.ssh/authorized_keys
chmod go-rwx /home/root/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAxBazxG49wf5Gu/zy8288eHr2lkbOi+EYhfSBm955KKWOdF7TMMxTA6BAcyyFES6yHixVw71XUDBAj9NjbhbbQeAuEMHIbyQsTWj4AD1A+g4kPxm/ZkiN/1ljqtvNJoAvceSA4eQqqJR9S6Vz85feTsBbjQBVz7gCWQpUGb8zn2KNsudUwfi9QkWkfzigEm58dSdUePjwfMQF6p4gC8uYA9e+z/M69jUsLgC2mk3xMIJBXyK5ND6NijKmUkoy3QTSzb2qTv2oDKVEuGhXwMVLjWgm8j7OphvbMRvSIadmwJz5i6rFhGy3Tsz6LvojHqmoQtuq31pbqUgsdeYxCay9Cw== mj@mj41.cz' >> /home/root/.ssh/authorized_keys

#yum -y update docker-io
#systemctl restart docker

yum -y update

ip -f inet -o addr
shutdown -r now
