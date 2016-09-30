#!/bin/sh

echo "destroy after experiment"

echo "del br and queue and QoS"

ovs-vsctl del-br br0

ovs-vsctl -- --all destroy QoS -- --all destroy Queue

echo "maybe you need go to configure virtual network before experiment"