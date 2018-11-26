misc_raw_image_file_usage() {
	usage_section "Raw image file"
	
	usage_description "This plugin provides a 'raw' image file for
	                  platform plugins to work their magic in."
	
	usage_option "--image-size <size>" \
	             "Make the disk image <size>GB in size."           \
	             "This sets the *maximum* capacity of the virtual" \
	             "disk that this box will use; the actual size"    \
	             "of the base box on disk will be much smaller,"   \
	             "will be determined by the amount of software"    \
	             "installed."

	usage_option "--image-format <format>" \
				 "Output format of the image file" \
				 	"- raw, qcow2 etc; See qemu-img(1) for supported formats." \
				 "" \
				 "Default: raw"

	usage_option "--nocompress" \
				 "Do not compress image file with bzip2" \
				 "" \
				 "Default: True"

}

register_usage "misc_raw_image_file_usage"

parseopt "image-size" "true" "10"
parseopt "image-format" "true" "raw"
parseopt "nocompress" "false"

