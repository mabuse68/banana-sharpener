#!/bin/bash
HOST='192.168.1.1' # Default IP  (factory settings)
USER='micro' # Default user (factory settings)
PASSWD='python' # Default password (factory settings)
FILE='test.py' # If no file is psecified it will default to "test.py"


while [[ $# -ge 1 ]]
do
key="$1"

case $key in -f|--file)
	FILE="$2"
	shift # Look for the next parameters, if any
	;;
	-s|--server)
	HOST="$2"
	;;
	-h|--help)
	echo 'Usage: WP-up [-f <filename>] [-s <hostname>]'
	exit 0;
	;;
	*)
	echo 'Unknown parameter or wrong arguments number'
	echo 'Usage: WP-up [-f <filename>] [-s <hostname>]'
	exit 1;
	;;
esac
shift
done
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
passive #This set passive-mode on Linus, comment this line on OSX (passive by default)
cd flash #Where the root filesystem resides, change at will for custom locations
put $FILE
quit
END_SCRIPT
exit 0

# Invoke this script either from command line
# or from an editor, see here-under cases
# VI: Save your work - :w - ; Invoke script - :! ./WP-up -f % -
