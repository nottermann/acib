mirroropt=""
if [ -n "${OPTS[mirror]}" ]; then
	mirroropt="--mirror=${OPTS[mirror]}"
fi

cacheopt="--cache 0"
if [ -n "${OPTS[cache]}" ]; then
  cacheopt="--cache 1 --cache-dir ${OPTS[cache]}"
fi

distropt="centos-6"
if [ ! -z "${ANCHOR}" ]; then
  distropt="${OPTS[os]}-anchor"
fi

if ! rinse  \
           --arch "${OPTS[arch]}" \
           --distribution $distropt \
           $mirroropt \
           $cacheopt \
           --directory "$TARGET" |&
               tee "${WORKSPACE}/rinse_output" |
               spin "Running bootstrap"; then
	error "Bootstrap failed:"
	cat "${WORKSPACE}/rinse_output"
	exit 1
fi

# Cleanup rinse RPM packages
rinse_rpm_cache="${TARGET}/*.rpm"

rm -f $rinse_rpm_cache
