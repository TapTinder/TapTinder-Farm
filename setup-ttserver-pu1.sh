#!/bin/bash

set -e
set -x

if [ -z "$1" ]; then
	echo "Missing CMD parameter."
	exit 1
fi

if [ -z "$2" ]; then
	echo "Missing TTSERVER_BRANCH parameter."
	exit 1
fi

if [ -z "$3" ]; then
	echo "Missing TTSERVER_PREFIX parameter."
	exit 1
fi

if [ -z "$4" ]; then
	echo "Missing TTSERVER_PORT parameter."
	exit 1
fi

CMD="$1"
TTSERVER_BRANCH="$2"
TTSERVER_PREFIX="$3"
TTSERVER_PORT="$4"

mkdir -p ~/tt-server-host
cd ~/tt-server-host

if [ ! -d '.git' ]; then
	git clone https://github.com/TapTinder/Docker-TapTinder-Server.git .
	git checkout $TTSERVER_BRANCH
else
	git checkout $TTSERVER_BRANCH
	git pull
fi

export TTS_IMAGE="mj41/tt-server:$TTSERVER_BRANCH"
export TTCL_IMAGE="mj41/tt-client:$TTSERVER_BRANCH"

docker pull $TTS_IMAGE
docker pull $TTCL_IMAGE

if [ "$CMD" == "update" ]; then
	./ttdocker $TTSERVER_PREFIX rm both
fi

# setup | update
./ttdocker $TTSERVER_PREFIX setup both $TTSERVER_PORT debug
