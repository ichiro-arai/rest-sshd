install_dir=/opt/rest-sshd/


mkdir -p ${install_dir}
cp -r ./example ${install_dir}

base_sshd_config='/etc/ssh/sshd_config'
sshd_config_file=${install_dir}/rest_sshd_config


cat ${base_sshd_config} > ${sshd_config_file}
echo "PidFile /tmp/rest-sshd.pid" >> ${sshd_config_file}
echo "ForceCommand sh /opt/rest-sshd/example/handler.sh" >> ${sshd_config_file}

