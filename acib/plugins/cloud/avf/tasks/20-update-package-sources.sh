facter_version="1.7"
augeas_version="1.2"

if [ "${OPTS[os]}" == "centos6" ]; then

	sources_list="${TARGET}/etc/yum.repos.d/*.repo"

	#rm -f $sources_list

	cat > ${TARGET}/etc/yum.repos.d/trogdor.repo <<EOF
[trogdor-centos]
name=Trogdor - CentOS Base
baseurl=http://mrepo.engineroom.anchor.net.au/centos/\$releasever/os/\$basearch/
enabled=1
gpgcheck=0

[trogdor-updates]
name=Trogdor - CentOS Updates
baseurl=http://mrepo.engineroom.anchor.net.au/centos/\$releasever/updates/\$basearch/
enabled=1
gpgcheck=0

[trogdor-epel]
name=Trogdor - EPEL
baseurl=http://mrepo.engineroom.anchor.net.au/epel/\$releasever/\$basearch/
enabled=1
gpgcheck=0

[trogdor-filtergen]
name=Trogdor - Filtergen
baseurl=http://packages.engineroom.anchor.net.au/feature/filtergen/centos/\$releasever/\$basearch/
enabled=1
gpgcheck=0
priority=50

[trogdor-filtergen]
name=Trogdor - Filtergen
baseurl=http://packages.engineroom.anchor.net.au/feature/filtergen/centos/\$releasever/\$basearch/
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

fi
