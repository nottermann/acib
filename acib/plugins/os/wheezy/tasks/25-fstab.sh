if ! optval lvname >/dev/null; then
    cat <<EOF >"${TARGET}/etc/fstab"
/dev/vda1 / ext4 defaults 0 1
EOF

else
    # Disk based image with LVM
    # VG/LV names may be supplied with a hyphen, so substitute them now
    fstab_vgname=$(sed 's/-/--/g' <<< $(optval vgname))
    fstab_lvname=$(sed 's/-/--/g' <<< $(optval lvname))

    cat <<EOF >"${TARGET}/etc/fstab"
/dev/mapper/${fstab_vgname}-${fstab_lvname} / ext4 defaults 0 1
/dev/vda1 /boot ext3 defaults 0 2
EOF

fi