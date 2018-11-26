cloud_openstack_usage() {
	usage_section "openstack box"
	
	usage_description "This plugin builds a raw image suitable for
	                  use with the Anchor Openstack cloud"
}

OUTPUT_IMAGE_DIR="/var/cache/osimage" # Output image location
ANCHOR=1 # Activate alternate rinse OS config

register_usage "cloud_openstack_usage"
	
load_plugin_or_die "misc/raw-image-file"
load_plugin_or_die "partitioner/full-disk"
load_plugin_or_die "misc/ext4-filesystem"

load_plugin_or_die "package/grub"
load_plugin_or_die "package/sshd"
