if [ "${OPTS[os]}" == "centos6" ]; then

	sources_list="${TARGET}/etc/yum.repos.d/*.repo"

	#rm -f $sources_list

	cat > ${TARGET}/etc/yum.repos.d/trogdor.repo <<EOF
[trogdor-centos]
name=Trogdor - CentOS Base
baseurl=http://mrepo.engineroom.anchor.net.au/centos/\$releasever/os/\$basearch/
enabled=1
gpgcheck=0

[trogdor-updates]
name=Trogdor - CentOS Updates
baseurl=http://mrepo.engineroom.anchor.net.au/centos/\$releasever/updates/\$basearch/
enabled=1
gpgcheck=0

[trogdor-epel]
name=Trogdor - EPEL
baseurl=http://mrepo.engineroom.anchor.net.au/epel/\$releasever/\$basearch/
enabled=1
gpgcheck=0

EOF

fi
