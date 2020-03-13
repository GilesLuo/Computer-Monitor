#!/bin/bash

if [[ "$1" != ?* ]]
then
	echo "Missing command to execute..."
	echo "Usage: watchdog.sh command checker [time_to_sleep_between_checks_in_secs=300]"
fi

if [[ "$2" != ?* ]]
then
	echo "Missing checker command (should exit 0 iff command is still running)..."
	echo "Usage: watchdog.sh command checker [time_to_sleep_between_checks_in_secs=300]"
fi

if [[ "$3" == ?* ]]
then
	check_time="$3"
else
	check_time=300
fi

while true
do
	exec "$1" &
	sleep $check_time

	bash "$2"
	while [[ "$?" == 0 ]]
	do
		sleep $check_time
		bash "$2"
	done

	ps faux | grep python3 | grep DRLMAPF_A3C_RNN.py | grep -v grep | while read a pid g
	do
		kill -9 $pid
	done
done
