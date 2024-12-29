# Initialize
sec=0

# Update functions
update_cpu() {
  cpu=$(awk '{print $1}' /proc/loadavg)
}

update_memory() {
  memory=$(free -h | awk 'NR==2 {print $3}')
}

update_time() {
  time=$(date "+%b %d %H:%M ")
}

update_bat() {
  if [[ -e /sys/class/power_supply/BAT1/status ]]; then
    bat_status=$(< /sys/class/power_supply/BAT1/status)
    if [[ -e /sys/class/power_supply/BAT1/capacity ]]; then
      bat_capacity=$(< /sys/class/power_supply/BAT1/capacity)
      bat="$bat_status $bat_capacity%"
    else
      bat="$bat_status (capacity not available)"
    fi
  fi
}


# Display function
display() {
    status=""
      [[ -n "$bat" ]] && status+="$bat "
      [[ -n "$time" ]] && status+="$time"
      xsetroot -name "$status"
}

# Set up signal handlers
trap "update_bat; display" "RTMIN"

# Initial updates
update_bat

# Main loop
while true; do
  sleep 1
  sec=$((sec + 1))
  case $((sec % 60)) in
    0) update_bat;;
    [1-5])
        update_cpu
        update_time
        display
      ;;
  esac
done

