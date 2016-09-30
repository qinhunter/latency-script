#!/bin/sh

#install iperf
sudo su
sudo apt-get update
sudo apt-get install iperf


#install sockperf 

git clone https://github.com/Mellanox/sockperf.git
cd sockperf
./autogen.sh 
./configure 
make
sudo make install

