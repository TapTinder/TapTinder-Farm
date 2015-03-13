#!/bin/bash

set -e
set -x

systemctl start docker
systemctl status docker

useradd -G docker ttuh

ip -f inet -o addr
