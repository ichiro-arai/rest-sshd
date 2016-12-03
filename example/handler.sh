args=(${SSH_ORIGINAL_COMMAND})
filetype=${args[1]}

case ${filetype} in
	text ) cat /opt/rest-sshd/example/`whoami`.txt ;;
	image ) cat /opt/rest-sshd/example/`groups`.jpg ;;
	* ) echo "no such type: ${filetype}" ; exit 1 ;;
esac

exit 0
