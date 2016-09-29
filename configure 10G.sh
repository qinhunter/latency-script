#!/bin/sh
#experiment 10G configuration
echo "
.......................................................................................................
..................................................1G...................................................
.......................................................................................................
"
echo "
create qos and queue"
ovs-vsctl -- set port eth2 qos=@newqos -- --id=@newqos create qos type=linux-htb  other-config:max-rate=10000000000 queues=0=@q0 -- --id=@q0 create queue other-config:min-rate=10000000000 other-config:max-rate=10000000000

echo"
show "

ovs-vsctl show 
echo "
list queue:"
ovs-vsctl list queue

echo "
list QoS:"
ovs-vsctl list qos

echo"do not forget iperf for server and client sockperf -s
sockperf ping-pong  -p 8899 -i 10.10.1.2 -t 30 --tcp --pps=100 --full-log sockperf-10G.log
"