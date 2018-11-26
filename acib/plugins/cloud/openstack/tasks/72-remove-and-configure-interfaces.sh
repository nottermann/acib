# Cloud images may hard code the eth0 interfaces so they
# boot with DHCP.

if [ "${OPTS[os]}" == "centos6" ]; then
	debug "configuring loopback and eth0 for dhcp - centos"
	rm -f ${TARGET}/etc/sysconfig/network-scripts/ifcfg-eth0
	rm -f ${TARGET}/etc/sysconfig/network-scripts/ifcfg-lo
	cat > ${TARGET}/etc/sysconfig/network-scripts/ifcfg-lo <<EOF
DEVICE=lo
IPADDR=127.0.0.1
NETMASK=255.0.0.0
NETWORK=127.0.0.0
# If you're having problems with gated making 127.0.0.0/8 a martian,
# you can change this to something else (255.255.255.255, for example)
BROADCAST=127.255.255.255
ONBOOT=yes
NAME=loopback

EOF
	cat > ${TARGET}/etc/sysconfig/network-scripts/ifcfg-eth0 <<EOF
DEVICE=eth0
ONBOOT=yes
BOOTPROTO=dhcp

EOF
elif [ "${OPTS[os]}" == "wheezy" ]; then
	debug "configuring ENI file for dhcp - debian"
	rm -f ${TARGET}/etc/network/interfaces
	cat > ${TARGET}/etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

EOF
fi
