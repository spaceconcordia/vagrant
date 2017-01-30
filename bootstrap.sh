#!/bin/bash

apt-get update
apt-get upgrade
apt-get install -y $(< /vagrant/packages.list)
