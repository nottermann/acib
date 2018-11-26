debug "Installing additional packages"

yum_packages="
acpid
bind-utils
cronie-noanacron
cyrus-sasl-plain
dmidecode
dmraid
filtergen
irqbalance
lftp
lsof
mailcap
man-pages
man-pages-overrides
microcode_ctl
mtr
ntp
ntsysv
parted
prelink
readahead
rsync
ruby-ipaddress
strace
tcpdump
telnet
tmpwatch
traceroute
vconfig
vim
vim-enhanced
wget
yum-plugin-downloadonly
yum-plugin-priorities
yum-plugin-versionlock
"

apt_packages="
debconf-utils
emacs
filtergen
fontconfig
gconf2-common
geoip-database
less
lvm2
m17n-db
pciutils
psmisc
ruby-selinux
shared-mime-info
sudo
ttf-dejavu-core
vim
vim-runtime
x11-common
adduser
locales
file
kbd
curl
rsync
bash-completion
"

if [[ "${OPTS[os]}" =~ "centos" ]] || [[ "${OPTS[os]}" =~ "rhel" ]]; then
    packages=$yum_packages
elif [ "${OPTS[os]}" == "wheezy" ]; then
    packages=$apt_packages
fi

if [ ! -z "${packages}" ]; then
    install_packages_in_target $packages
fi
