cleanup_lvm() {
    vgchange -an "$(optval vgname)"
}

register_cleanup cleanup_lvm

debug "Loopback device is $BLOCK_DEVICE"

pvcreate "${PARTITIONS[/]}" |& logpipe "pvcreate"
vgcreate "$(optval vgname)" "${PARTITIONS[/]}" |& logpipe "vgcreate"

if optval thinpool >/dev/null; then
    lvcreate "-V$(optval lvsize)" --thinpool "$(optval thinpool)" \
             -n "$(optval lvname)" "$(optval vgname)" |& \
             logpipe "lvcreate"
else
    lvcreate "-L$(optval lvsize)" -n "$(optval lvname)" \
             "$(optval vgname)" |& logpipe "lvcreate"
fi

declare -A PARTITIONS
PARTITIONS[/]="/dev/$(optval vgname)/$(optval lvname)"