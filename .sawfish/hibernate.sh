#!/bin/sh

. ~/.station
case $STATION in
    "work")
	i3lock -c 2f343f
	;;
esac

systemctl hibernate
