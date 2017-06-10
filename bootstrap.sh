#!/bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

apt-get install -y bc binutils-arm-linux-gnueabi build-essential check clang \
clang-format clang-tidy cmake g++-arm-linux-gnueabi gcc-arm-linux-gnueabi \
git htop libc6-armel-cross libc6-dev-armel-cross libgtest-dev liblz4-tool \
libncurses5-dev libncursesw5-dev linux-tools-common linux-tools-generic tmux \
unzip valgrind vim zip sqlite3 libsqlite3-dev libc6-i386 tree

# Clone the buildroot repo in the home directory.
cd /home/vagrant
if [ ! -d buildroot/arietta ]; then
	mkdir -p buildroot
	cd buildroot
	git clone https://github.com/spaceconcordia/buildroot arietta
fi

# Build the Googletest library.
mkdir -p /usr/src/gtest/build
cd /usr/src/gtest/build
sudo cmake -DCMAKE_BUILD_TYPE=Release ..
sudo make
sudo mv libg* /usr/lib
cd -

# The directory /vagrant/space-concordia and its subdirectories are possibly
# owned by root due to an oversight. This command changes ownership to vagrant.
chown -R vagrant:vagrant /vagrant/space-concordia
