#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

apt-get install -y bc binutils-arm-linux-gnueabi build-essential check clang \
clang-format clang-tidy cmake g++-arm-linux-gnueabi gcc-arm-linux-gnueabi \
git htop libc6-armel-cross libc6-dev-armel-cross liblz4-tool libncurses5-dev \
libncursesw5-dev linux-tools-common linux-tools-generic tmux unzip \
valgrind vim zip sqlite3 libsqlite3-dev libc6-i386 tree

# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone --recursive https://github.com/spaceconcordia/SpacecraftSoftware/
fi
cd -

# Clone the buildroot repo in the home directory.
cd /home/vagrant
if [ ! -d buildroot/arietta ]; then
	mkdir -p buildroot
	cd buildroot
	git clone https://github.com/spaceconcordia/buildroot arietta
fi


# We are no longer using Buildroot as a submodule so this command purges it from
# the repo.
cd /vagrant/space-concordia/SpacecraftSoftware
if [ -d buildroot ]; then
	git submodule deinit buildroot
	rm -rf buildroot
	rm -rf .git/modules/buildroot
fi
