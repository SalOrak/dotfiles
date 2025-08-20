bat0="/sys/class/power_supply/BAT0"


capacity=$(cat "$bat0/capacity")
status=$(cat "$bat0/status")

crit_ntfy=('5' '10' '15' '20' '25')

warn_ntfy=('35')

info_ntfy=('70' '79')


if [[ $status == "Discharging" ]]; then
    for s in "${warn_ntfy[@]}"; do
        if [[ $s == $capacity ]]; then
            dunstify --urgency=low "Battery is getting low: $s" --icon=dialog-warning
            exit 0
        fi
    done
    for s in "${crit_ntfy[@]}"; do
        if [[ $s == $capacity ]]; then
            dunstify --urgency=critical "Battery is LOW: $s" --icon=dialog-error
            exit 0
        fi
    done
elif [[ $status == "Charging" ]]; then
    # Send notification near full
    for s in "${info_ntfy[@]}"; do
        if [[ $s == $capacity ]]; then
            dunstify --urgency=normal "Battery is fully charged: $s" --icon=battery
            exit 0
        fi
    done
fi

exit 0
