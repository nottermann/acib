debug "Uninstalling packages"

yum_packages="
cronie-anacron
selinux-policy-targeted
"

apt_packages=""

if [[ "${OPTS[os]}" =~ "centos" ]] || [[ "${OPTS[os]}" =~ "rhel" ]]; then
	packages=$yum_packages
elif [ "${OPTS[os]}" == "wheezy" ]; then
	packages=$apt_packages
fi

if [ ! -z "${packages}" ]; then
	uninstall_packages_from_target $packages
fi