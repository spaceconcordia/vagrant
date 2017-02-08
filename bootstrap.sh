#!/bin/bash

apt-get update
apt-get upgrade
apt-get install -y $(< /vagrant/packages.list)

# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone --recursive https://github.com/spaceconcordia/SpacecraftSoftware/
fi
