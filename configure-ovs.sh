#!/bin/sh

#configure 
echo "configure begin"



rmmod openvswitch
echo "finish rmmod"
modprobe nf_conntrack
modprobe nf_defrag_ipv4
modprobe nf_defrag_ipv6
modprobe libcrc32c
modprobe vxlan
modprobe gre
#insmod /users/wenfeiwu/openvswitch-2.5.0/datapath/linux/openvswitch
insmod datapath/linux/openvswitch.ko

#modinfo datapath/linux/openvswitch.ko
#insmod datapath/linux/openvswitch.ko MSS=8946 ECE_CLEAR=1
#insmod datapath/linux/openvswitch.ko MSS=1446 ECE_CLEAR=0

kill `cd /usr/local/var/run/openvswitch && cat ovsdb-server.pid ovs-vswitchd.pid`

echo "have killed"

rm -rf /usr/local/etc/openvswitch
mkdir -p /usr/local/etc/openvswitch


#ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
#use the default setting
echo "after mkdir..............................................................."
ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema
echo "after ovsdb-tool.........................................................."
ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
         --pidfile --detach

ovs-vsctl --no-wait init

ovs-vswitchd --pidfile --detach

echo "configure end and go to configure virtual network before experiment"
