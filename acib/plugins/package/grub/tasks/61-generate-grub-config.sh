if [ -x "${TARGET}/usr/sbin/update-grub" ]; then
	run_in_target "/usr/sbin/update-grub"
else
	if ! [ -e "${TARGET}/etc/grub.conf" ]; then
		ln -s "/boot/grub/grub.conf" "${TARGET}/etc/grub.conf"
	fi
	
	if ! [ -e "${TARGET}/boot/grub/menu.lst" ]; then
		ln -s "/boot/grub/grub.conf" "${TARGET}/boot/grub/menu.lst"
	fi
	
	if ! [ -e "${TARGET}/boot/grub/grub.conf" ]; then
		kernel="$(basename $(ls "${TARGET}/boot/"vmlinuz*))"
		if [ -z "$kernel" ]; then
			fatal "No kernel found"
		fi
		
		initrd="$(basename $(ls "${TARGET}/boot/"init*img*))"
		if [ -z "$initrd" ]; then
			fatal "No initrd found"
		fi

		if ! optval lvname >/dev/null; then
			cat <<EOF >"${TARGET}/boot/grub/grub.conf"
default=0
timeout=5
title Linux
	root (hd0,0)
	kernel /boot/$kernel ro root=/dev/vda1
	initrd /boot/$initrd
EOF

else
    # Disk based image with LVM
    # VG/LV names may be supplied with a hyphen, so substitute them now
    grub_vgname=$(sed 's/-/--/g' <<< $(optval vgname))
    grub_lvname=$(sed 's/-/--/g' <<< $(optval lvname))

			cat <<EOF >"${TARGET}/boot/grub/grub.conf"
default=0
timeout=5
title Linux
	root (hd0,0)
	kernel /$kernel ro root=/dev/mapper/${grub_vgname}-${grub_lvname}
	initrd /$initrd
EOF

		fi
	fi
fi

	
