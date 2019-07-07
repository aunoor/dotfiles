#!/bin/sh

/usr/lib/polkit-gnome-authentication-agent-1 &

~/.fehbg &

. ~/.station
case $STATION in
    "work")
	~/bin/polybar work &
	~/bin/Telegram &
	/opt/Rocket.Chat/rocketchat-desktop &
	sleep 1
	~/bin/polybar-msg cmd restart
	/usr/bin/conky -b -m 0
	/usr/bin/conky -b -m 1
	;;
    "thinkpad")
	/usr/bin/xcompmgr -C -n &
	~/bin/polybar thinkpad &
	;;
    "home")
	/usr/bin/xcompmgr -C -n &
	/usr/bin/polybar home &
	~/bin/Telegram &
	sleep 1
	~/bin/polybar-msg cmd restart
	/usr/bin/conky -b
	/usr/bin/xset dpms 600 1200 1800
	;;
esac
