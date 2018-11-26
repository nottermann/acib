puppet_version="3.6"

if [ "${OPTS[os]}" == "centos6" ]; then

	sources_list="${TARGET}/etc/yum.repos.d/*.repo"

	#rm -f $sources_list

	cat > ${TARGET}/etc/yum.repos.d/puppet.repo <<EOF

[trogdor-puppet]
name=Trogdor - Puppet
baseurl=http://packages.engineroom.anchor.net.au/feature/puppet-${puppet_version}/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-puppet-support]
name=Trogdor - Puppet Support
baseurl=http://packages.engineroom.anchor.net.au/feature/puppet-support/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-facter]
name=Trogdor - Facter
baseurl=http://packages.engineroom.anchor.net.au/feature/facter-${facter_version}/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-facter-support]
name=Trogdor - Facter Support
baseurl=http://packages.engineroom.anchor.net.au/feature/facter-support/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-augeas]
name=Trogdor - Augeas
baseurl=http://packages.engineroom.anchor.net.au/feature/augeas-${augeas_version}/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-augeas-support]
name=Trogdor - Augeas Support
baseurl=http://packages.engineroom.anchor.net.au/feature/augeas-support/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

EOF

elif [ "${OPTS[os]}" == "wheezy" ]; then

	cat <<EOF | chroot "${TARGET}" apt-key add -
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (GNU/Linux)

mQINBFMAdzIBEACz5RPCljaxZAUmCCmW8N153lp2Y+0IufMeN7gCxmu1mGah2Lkp
96WWpv7ZimzIt6yONK8dg2Nqerj2Ltvx2YBCoi2lBHRHDEYnRICzsiFaciivvaBb
qr+d8cRL62cmnpZWTiHmXfInzGWWGc4y4xM8pYsiIGWpaajioVCu9vTUfdab4u/f
Z/1gRuKU0kS+Y07Rj8XxxPUqIGqQY9tsHvPqdoIRl7n+S8XErHzKFUJ15eAK8FFX
mhBPprkwZa+AyQopLr0K4lyqEX2kdRDloQ6KLKES3CNN2MssSjv7wlJxzhaCJ9wu
po3l51FS+JGZldzZmdGYthWVenyhNEB9055s3xXzNEWvi9ByJdGZvzo7lmzVlYMY
4ffHwMHxoa6hXBW72qIAvrTMMbN4ppAksWpjUMJXP7faMkvZLZ7EbiTIFaGc0cEY
QDMHT90NUm7tVHf8cKzanivBOaino7D9vpqZnB//Bw7406LWGoRkPnPAZ+RLK+NG
Q82+Vl41O1uL5At/W2sq5vYDD3OHZBAKmcAMfkfUd2VUtlejm1ZAHbgbBjsXOYMT
06oYI0GMLNtaCS1BGamR6eMZUlV1cdnmJNM6IUUeZC0+GNpzSh8YmKbte9BOe4xF
OMLPhl6U8vmFqaPBJtpN+/LvY232Qa2Ke0ZOb/mC7xRDEcmiFMYJtoukowARAQAB
tDxBbmNob3IgU3lzdGVtcyAocGFja2FnZSBzaWduaW5nIGtleSkgPHN1cHBvcnRA
YW5jaG9yLm5ldC5hdT6JAj4EEwECACgFAlMAdzICGwMFCQHhM4AGCwkIBwMCBhUI
AgkKCwQWAgMBAh4BAheAAAoJEDDqghrLTkZX7AAQAJDFvFjpAOYnQ1W3Gnoiwapo
M65F4Gt/Xnz5UgGHdjN/VquNVoegy1GbyiUO9FbdCJT0H/sIOtbyC9v5u07C5JZm
a3nqURdo7LDpJBoA4a81xAZYoVYqsgHymssfg65xKPC1xwbVXkPHh9t9ECvwNb48
t3zqomDPjcbCyUNGgrW4Tew+qkyAq1/OfpR6P3VFmc2TVhlnYUkqrOwxwZeCvoHy
2LC/Eb4JgDsVfgjtHhievcnS95q7W7RDsfyr/ICK+yqUAktH+1HJCCeWeJfk/iIB
d7KtEsrW8gaffy/6DSvm6q34e8et9AsTJcABSEl2x2lgHY7T43dKHudq7bSojL6u
ZV4BquwZggn9vIczWcGWQOtwElZ62ioTKpFhtE5CQnR70vJQR28DjMedVaheeXOF
c3PjR+UJ+OGRD8jEWPy/LPaQ28FgaVJSRqj5/TK12NDJeI+KqNfx27fS/Pa2StIp
gyOd+5/rHk2Lq1TnRVXkJC8Ar3KvZ0LqURd5AGLvZGhx4vW2hCCg/j48jDSpFxuO
yxJP/z1hE+FH7AJfbY4FuEO4shRCwUlL5uUZqANKN5Jv9Ji/u9LAP09PHtqGwllo
CP0QA5ygtHXHL0AhwPJ3FGalWZ0jcFMGsrj+K81jaC5GKFiVTQum60g6iCAjLYX1
pIM9p5lKPMEcq04M/mHk
=/rlF
-----END PGP PUBLIC KEY BLOCK-----

EOF

	# Puppet
	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-puppet-${puppet_version}.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/puppet-${puppet_version}/debian/ wheezy puppet-${puppet_version}
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/puppet-${puppet_version}/debian/ wheezy puppet-${puppet_version}
EOF

	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-puppet-support.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/puppet-support/debian wheezy puppet-support
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/puppet-support/debian wheezy puppet-support
EOF

	# Facter
	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-facter-${facter_version}.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/facter-${facter_version}/debian wheezy facter-${facter_version}
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/facter-${facter_version}/debian wheezy facter-${facter_version}
EOF

	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-facter-support.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/facter-support/debian wheezy facter-support
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/facter-support/debian wheezy facter-support
EOF

	# Augeas
	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-augeas-${augeas_version}.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/augeas-${augeas_version}/debian wheezy augeas-${augeas_version}
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/augeas-${augeas_version}/debian wheezy augeas-${augeas_version}
EOF

	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-augeas-support.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/augeas-support/debian wheezy augeas-support
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/augeas-support/debian wheezy augeas-support
EOF

	# Filtergen
	cat <<EOF >${TARGET}/etc/apt/sources.list.d/feature-filtergen.list
deb [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/filtergen/debian wheezy filtergen
deb-src [ arch=amd64 ] http://packages.engineroom.anchor.net.au/feature/filtergen/debian wheezy filtergen
EOF

	# Package priorities

	cat <<EOF >>${TARGET}/etc/apt/preferences
Package: *
Pin: release c=augeas-${augeas_version}
Pin-Priority: 800

Package: *
Pin: release c=augeas-support
Pin-Priority: 800

Package: *
Pin: release c=facter-${facter_version}
Pin-Priority: 800

Package: *
Pin: release c=facter-support
Pin-Priority: 800

Package: *
Pin: release c=filtergen
Pin-Priority: 800

Package: *
Pin: release c=puppet-${puppet_version}
Pin-Priority: 800

Package: *
Pin: release c=puppet-support
Pin-Priority: 800
EOF

fi
