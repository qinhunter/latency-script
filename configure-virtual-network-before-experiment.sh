#!/bin/sh

#configure network
#ovs-vsctl des

echo "configure br0 and eth2................................................."



ovs-vsctl del-br br0

ovs-vsctl add-br br0

ovs-vsctl add-port br0 eth2

echo "configure eth2........................................................."

ifconfig eth2 up
ifconfig eth2 0
ifconfig br0 10.10.1.1 netmask 255.255.255.0

ifconfig eth2 mtu 9000
ifconfig br0 mtu 9000

echo "configure net end and then you need to configure ovs-qos rate-limiter"
