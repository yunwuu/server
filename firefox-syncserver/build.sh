#!/bin/bash

default_branch=release-v1.9.1

if [ `whoami` !=  "root" ]
then
    echo "You should run this script under root."
    exit
fi


apt update
apt install docker.io docker-compose -y


cd /usr/src
git clone -b "$default_branch" https://github.com/mozilla-services/syncserver.git
cd syncserver


docker build -t syncserver:latest .

docker images
