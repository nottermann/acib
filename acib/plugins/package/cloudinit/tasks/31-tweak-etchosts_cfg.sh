debug "Tweaking cloud-init config"

if ! [ -d ${TARGET}/etc/cloud/cloud.cfg.d/ ];then
	mkdir -p ${TARGET}/etc/cloud/cloud.cfg.d
fi

cat << EOF >"${TARGET}/etc/cloud/cloud.cfg.d/10_etc_hosts.cfg"
manage_etc_hosts: True
EOF

