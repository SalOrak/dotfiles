temp=$(sensors | grep 'CPU:' | awk '{print $2}' | tr -d '+°C' | awk -F. '{print $1}')


crit_ntfy=93

if [[ $temp -ge $crit_ntfy ]]; then
            dunstify --urgency=critical "Temperate is too high!: $temp" --icon=gnome-abrt
fi

exit 0 
