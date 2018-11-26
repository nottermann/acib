debug "Installing Puppet Client from Feature-Repo."

yum_packages="
cloud-init
cloud-utils
"

apt_packages="
cloud-init
cloud-utils
cloud-initramfs-growroot
"

if [[ "${OPTS[os]}" =~ "centos" ]] || [[ "${OPTS[os]}" =~ "rhel" ]]; then
    packages=$yum_packages
elif [ "${OPTS[os]}" == "wheezy" ]; then
    packages=$apt_packages
fi

if [ ! -z "${packages}" ]; then
    install_packages_in_target $packages
fi
