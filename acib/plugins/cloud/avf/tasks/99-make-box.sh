[ ! -d ${OUTPUT_IMAGE_DIR} ] && mkdir -p ${OUTPUT_IMAGE_DIR}

#output_file="${OUTPUT_IMAGE_DIR}/$(date +%Y%m%d)-avf-${OPTS[os]}"
if [ "${OPTS[os]}" == "wheezy" ]; then
	osname="debian-7"
elif [ "${OPTS[os]}" == "centos6" ]; then
	osname="centos-6"
fi

if [ ${built_with_puppet} == "yes" ]; then
	has_puppet="puppet"
else
	has_puppet="nopuppet"
fi

hour=$(date +%R | cut -f1 -d':')
output_file="${OUTPUT_IMAGE_DIR}/linux-${osname}-${has_puppet}-$(date +%Y%m%d)-${hour}"

# Convert the raw image to qcow2
if [ "${OPTS[image-format]}" != "raw" ]; then
    cd ${OUTPUT_IMAGE_DIR}

    output_file="${output_file}.${OPTS[image-format]}"

    qemu-img convert -f raw -O "${OPTS[image-format]}" \
"${IMAGEFILE}" "${output_file}" \
| spin "Converting raw image file to ${OPTS[image-format]}"

else
    output_file="${output_file}.img"

    mv "${IMAGEFILE}" "${output_file}"
fi

# and compress
if [ "${OPTS[nocompress]}" == "n" ]; then
    bzip2 --best "${output_file}" | spin "Compressing image file with bzip2"

    output_file="${output_file}.bz2"
fi

if [ "${OPTS[debug]}" == "y" ]; then
    mv "${WORKSPACE}/build.log" /tmp
fi

info "Your box is now available in '${output_file}'"
