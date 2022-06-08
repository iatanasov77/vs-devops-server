#!/bin/bash

mkdir -p /etc/docker
echo '{ "hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"] }' | tee /etc/docker/daemon.json
mkdir -p /etc/systemd/system/docker.service.d/
echo [Service] | tee /etc/systemd/system/docker.service.d/docker.conf
echo ExecStart= | tee -a /etc/systemd/system/docker.service.d/docker.conf
echo ExecStart=/usr/bin/dockerd | tee -a /etc/systemd/system/docker.service.d/docker.conf

echo "* Enable and Start Docker ..."
systemctl daemon-reload
service docker stop
dockerd > /dev/null 2>&1 &
