cleanup_mount_specials() {
	umount "${TARGET}/dev/pts"
	umount "${TARGET}/sys"
	umount "${TARGET}/proc"
	umount "${TARGET}/dev"
}

register_cleanup "cleanup_mount_specials"

[ ! -d  "${TARGET}/dev" ] && mkdir -p "${TARGET}/dev"

mount --bind /dev "${TARGET}/dev"

if ! run_in_target mount | grep -q "/proc"; then
	run_in_target mount -t proc none /proc
fi

if ! run_in_target mount | grep -q "/sys"; then
	run_in_target mount -t sysfs none /sys
fi

if ! run_in_target mount | grep -q "/dev/pts"; then
	run_in_target mount -t devpts none /dev/pts
fi
