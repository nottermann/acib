touch "${TARGET}/etc/configure-networking"
touch "${TARGET}/etc/set-root-password"
touch "${TARGET}/etc/resize-partition-table-please"

for init_script in \
"avf-change-locales" \
"avf-change-mountcount" \
"avf-configure-networking" \
"avf-create-swap" \
"avf-extend-pv" \
"avf-set-root-password" \
"avf-setup-root-ssh-keys"; do
	install_init_script "$(plugin_file cloud/avf init_scripts/${init_script})"
done
