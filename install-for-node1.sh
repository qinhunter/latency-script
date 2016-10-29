#!/bin/sh

#install iperf

sudo apt-get update
sudo apt-get install iperf -y


#install sockperf 

sudo apt-get install perl automake autoconf m4 libtool gcc g++ -y
git clone https://github.com/Mellanox/sockperf.git
cd sockperf
./autogen.sh 
./configure 
make
sudo make install

