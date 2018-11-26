# Disallow password authentication, public/private key only
sed -i -e 's/^#PasswordAuthentication no/PasswordAuthentication yes/' "${TARGET}/etc/ssh/sshd_config"
