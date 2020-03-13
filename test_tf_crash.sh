#!/bin/bash

. ~/.bashrc

if [[ $(top -n 1 | head -n 9 | tail -n 2 | grep python3 | wc -l) == 0 ]]
then
	# Code has crashed...
	echo "Code has crashed..."
	exit -1
fi

exit 0
