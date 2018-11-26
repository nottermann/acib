touch "${TARGET}/etc/configure-networking"

for init_script in \
"avf-change-locales" \
"avf-change-mountcount" \
"avf-configure-networking"; do
	install_init_script "$(plugin_file cloud/openstack init_scripts/${init_script})"
done
