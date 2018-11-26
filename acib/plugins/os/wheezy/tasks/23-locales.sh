# The only locale we can be pretty sure we'll need...
echo "en_AU.UTF-8 UTF-8" >"${TARGET}/etc/locale.gen"

run_in_target locale-gen >/dev/null 2>&1
