#!/bin/bash

apt-get update
apt-get upgrade
apt-get install -y $(< /vagrant/packages.list)

# Clone and install Google Test.
if [ ! -d /usr/local/src/googletest ]; then
	cd /usr/local/src
	git clone https://github.com/google/googletest
	cd googletest
	mkdir build && cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make
	make install
else
	cd /usr/local/src/googletest
	git pull
	cd build
	make
	make install
fi
