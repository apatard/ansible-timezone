#!/bin/bash

# by default, return input
convert_timezone()
{
    echo "$@"
}

# are we on Debian-like ? if so, override convert_timezone
if [ -f /var/lib/dpkg/info/tzdata.config ]; then
	func=`cat /var/lib/dpkg/info/tzdata.config | awk 'BEGIN {found=0}; /^convert_timezone/ {found=1}; (found==1) {print $0} /^}/ {found=0}'`
	eval $func
fi

# handle bad input
TZ='Etc/UTC'
[ -f "/usr/share/zoneinfo/$1" ] && TZ="$1"

convert_timezone "$TZ"
