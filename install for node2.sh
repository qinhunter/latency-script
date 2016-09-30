#!/bin/sh

#install iperf
sudo su
sudo apt-get update
sudo apt-get install iperf


#install sockperf 
cd /
git clone https://github.com/Mellanox/sockperf.git
cd sockperf
./autogen.sh 
./configure 
make
sudo make install


#install ovs
cd /
wget http://openvswitch.org/releases/openvswitch-2.5.0.tar.gz
tar xzvf openvswitch-2.5.0.tar.gz 
cd openvswitch-2.5.0/
apt-get install -y git automake autoconf gcc uml-utilities libtool build-essential pkg-config linux-headers-`uname -r`
apt-get -y install libnl-dev
./boot.sh
./configure --with-linux=/lib/modules/`uname -r`/build
make
make install

echo "finish install 
go to configure ovs "

