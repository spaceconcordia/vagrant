#!/bin/bash

cd ~
wget https://buildroot.org/downloads/buildroot-2016.11.tar.gz
tar zxf buildroot-2016.11.tar.gz && rm buildroot-2016.11.tar.gz

cd buildroot-2016.11
make acmesystems_arietta_g25_256mb_defconfig
make
