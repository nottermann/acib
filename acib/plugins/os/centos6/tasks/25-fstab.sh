if ! optval lvname >/dev/null; then
    cat <<EOF >"${TARGET}/etc/fstab"
/dev/vda1 / ext4 defaults 1 1
tmpfs   /dev/shm        tmpfs   defaults        0       0
devpts  /dev/pts        devpts  gid=5,mode=620  0       0
sysfs   /sys    sysfs   defaults        0       0
proc    /proc   proc    defaults        0       0
EOF

else
    # Disk based image with LVM
    # VG/LV names may be supplied with a hyphen, so substitute them now
    fstab_vgname=$(sed 's/-/--/g' <<< $(optval vgname))
    fstab_lvname=$(sed 's/-/--/g' <<< $(optval lvname))

    cat <<EOF >"${TARGET}/etc/fstab"
/dev/mapper/${fstab_vgname}-${fstab_lvname} / ext4 defaults 1 1
/dev/vda1 /boot ext3 defaults 1 2
tmpfs   /dev/shm        tmpfs   defaults        0       0
devpts  /dev/pts        devpts  gid=5,mode=620  0       0
sysfs   /sys    sysfs   defaults        0       0
proc    /proc   proc    defaults        0       0
EOF

fi