#! /bin/sh

# Run program unless it's already running.

if [ -z "`ps -Af | grep -w ".*$1" | grep -v grep | grep -v runonce.sh`" ]; then
	$@
fi
