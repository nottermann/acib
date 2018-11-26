cloud_avf_usage() {
	usage_section "avf box"
	
	usage_description "This plugin builds a raw image suitable for
	                  use with the Anchor Virtual Fleet - AVF."
}

OUTPUT_IMAGE_DIR="/var/cache/osimage" # Output image location
ANCHOR=1 # Activate alternate rinse OS config

register_usage "cloud_avf_usage"
	
load_plugin_or_die "misc/raw-image-file"
load_plugin_or_die "partitioner/full-disk-with-lvm"
load_plugin_or_die "misc/ext4-filesystem"
load_plugin_or_die "misc/ext3-boot-filesystem"

load_plugin_or_die "package/grub"
load_plugin_or_die "package/sshd"
