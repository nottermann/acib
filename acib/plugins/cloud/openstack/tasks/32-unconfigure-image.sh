debug "Reseting/Unconfiguring image"

# Implement any virt-sysprep-ish tasks here

# Networking

# RHEL/Centos
interfaces="${TARGET}/etc/sysconfig/network-scripts/ifcfg-eth*"
if [ ! -z "${interfaces}" ]; then
	rm -vf ${interfaces}
fi

# Debian
if [ -e "${TARGET}/etc/network/interfaces" ]; then
	rm -vf "${TARGET}/etc/network/interfaces"
fi

# All
echo -n >"${TARGET}/etc/udev/rules.d/70-persistent-net.rules"
echo -n >"${TARGET}/lib/udev/rules.d/75-persistent-net-generator.rules"
