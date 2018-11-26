debug "Installing Puppet Client from Feature-Repo."

if [[ "${OPTS[os]}" =~ "centos" ]] || [[ "${OPTS[os]}" =~ "rhel" ]]; then
        run_in_target yum install -y puppet
elif [ "${OPTS[os]}" == "wheezy" ]; then
        run_in_target apt-get install -y puppet
fi
