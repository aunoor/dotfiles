#!/bin/sh

~/.fehbg &

. ~/.station
case $STATION in
    "work")
	~/bin/polybar work &
	~/bin/Telegram &
	/opt/Rocket.Chat/rocketchat-desktop &
	sleep 1
	~/bin/polybar-msg cmd restart
	;;
    "thinkpad")
	~/bin/polybar thinkpad &
	;;
esac
