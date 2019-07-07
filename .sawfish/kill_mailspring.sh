#!/bin/sh

#set -- junk `pidof mailspring`

read -ra arr <<< `pidof mailspring`

kill -15 ${arr[-1]}

