check_program_available "sfdisk -h" "sfdisk"
check_program_available "lvs >/dev/null 2>&1" "lvs"
check_program_available "vgs >/dev/null 2>&1" "vgs"
check_program_available "pvcreate -h >/dev/null 2>&1" "pvcreate"
check_program_available "vgcreate -h >/dev/null 2>&1" "vgcreate"
check_program_available "lvcreate -h >/dev/null 2>&1" "lvcreate"
