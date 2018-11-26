debug "Formatting /boot filesystem with ext3."

for part in "${!PARTITIONS[@]}"; do
	if ! [[ "$part" = "/boot" ]]; then
		# Not /boot filesystem partition; leave it alone
		continue
	fi
	
	mkfs.ext3 "${PARTITIONS[$part]}" |& spin "Formatting '$part' filesystem"
done
