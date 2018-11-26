##On Debian we unfortunately need to set this bit manually.

if [ -e ${TARGET}/boot/grub/grub.cfg ]; then
	debug "Changing GRUB device to vda1."
	sed -i 's/mapper\/loop[[:digit:]]p1/vda1/g' "${TARGET}/boot/grub/grub.cfg"
fi
