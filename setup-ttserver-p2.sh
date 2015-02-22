#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
	echo "Missing TTSERVER_BRANCH parameter."
	exit 1
fi

if [ -z "$2" ]; then
	echo "Missing TTSERVER_PREFIX parameter."
	exit 1
fi

if [ -z "$3" ]; then
	echo "Missing TTSERVER_PORT parameter."
	exit 1
fi

TTSERVER_BRANCH="$1"
TTSERVER_PREFIX="$2"
TTSERVER_PORT="$3"

systemctl start docker
systemctl status docker

# todo
#useradd -G docker ttuh
#su - ttuh

mkdir -p ~/tt-server-host
cd ~/tt-server-host

wget https://raw.githubusercontent.com/TapTinder/Docker-TapTinder-Server/$TTSERVER_BRANCH/ttdocker
chmod u+x ttdocker

export TTS_IMAGE="mj41/tt-server:$TTSERVER_BRANCH"
export TTCL_IMAGE="mj41/tt-client:$TTSERVER_BRANCH"

docker pull $TTS_IMAGE
docker pull $TTCL_IMAGE

./ttdocker $TTSERVER_PREFIX setup both $TTSERVER_PORT debug

ip -f inet -o addr
