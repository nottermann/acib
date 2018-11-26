[ ! -d ${OUTPUT_IMAGE_DIR} ] && mkdir -p ${OUTPUT_IMAGE_DIR}

hour=$(date +%R | cut -f1 -d':')
output_file="${OUTPUT_IMAGE_DIR}/$(date +%Y%m%d)-$hour-openstack-${OPTS[os]}.img"

mv "${IMAGEFILE}" "${output_file}"

if [ "${OPTS[debug]}" == "y" ]; then
    mv "${WORKSPACE}/build.log" /tmp
fi

info "Your box is now available in '${output_file}'"
