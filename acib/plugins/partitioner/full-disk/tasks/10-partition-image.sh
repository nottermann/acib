sfdisk -f -u S "$BLOCK_DEVICE" <<EOF >/dev/null 2>&1
2048,,83
EOF

declare -A PARTITIONS

PARTITIONS[/]="${BLOCK_DEVICE}p1"

