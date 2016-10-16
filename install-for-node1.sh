#!/bin/sh

#install iperf

apt-get update
apt-get install iperf


#install sockperf 

git clone https://github.com/Mellanox/sockperf.git
cd sockperf
./autogen.sh 
./configure 
make
sudo make install

