#!/bin/bash

echo "Archlinux system upgrade, `date +'%Y-%m-%dT%H:%M:%S'`, (Tomas' script)"

#check whether mobile data (hotspot Asus Zen8) is used
mobile_data=`nmcli -t -f name connection show --active | grep "Asus Zen8" | wc -l`

#will firefox be updated?
update_firefox=`checkupdates | grep firefox | wc -l`

if [[ ${mobile_data} -eq 0 ]]
	echo "We are on WiFi - YES"

	if [[ ${update_firefox} -eq 0 ]]
		echo "Firefox is not about to be updated."
		echo "I'm updating Arch linux. Running: 'pacman -Syu --noconfirm'"
		pacman -Syu --noconfirm
	else
		echo -e 'Firefox is about to be updated. This can not be done automatically!\nEXIT'

else
	echo -e 'Mobile data are being used (hotspot: Asus Zen8). Arch linux will not be updated\nEXIT'
fi
