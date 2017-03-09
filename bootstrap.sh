#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

apt-get install -y bc binutils-arm-linux-gnueabi build-essential check clang \
clang-format clang-tidy cmake g++-arm-linux-gnueabi gcc-arm-linux-gnueabi \
git htop libc6-armel-cross libc6-dev-armel-cross liblz4-tool libncurses5-dev \
libncursesw5-dev linux-tools-common linux-tools-generic qemu tmux unzip \
valgrind vim zip

# Clone the SpacecraftSoftware repo.
mkdir -p /vagrant/space-concordia
cd /vagrant/space-concordia
if [ ! -d SpacecraftSoftware ]; then
	git clone --recursive https://github.com/spaceconcordia/SpacecraftSoftware/
fi
