if [ "${OPTS[os]}" == "wheezy" ]; then
	cat <<EOF >> ${TARGET}/etc/apt/sources.list
deb http://http.debian.net/debian wheezy-backports main

EOF

fi
