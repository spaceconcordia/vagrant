#!/bin/bash
# Clones the Linux kernel in /home/vagrant and builds it.

cd ~
if [ ! -d "linux-4.4.16" ]; then
	git clone https://github.com/spaceconcordia/linux-4.4.16
fi
cd linux-4.4.16
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- acme-arietta_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- acme-arietta.dtb
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- zImage
