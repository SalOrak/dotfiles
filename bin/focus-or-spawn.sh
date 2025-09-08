# In Sway / i3 focus or executes the command
set -o errexit    # Used to exit upon error, avoiding cascading errors

expected_args=2
command_name=$0

usage() {
    echo -e "Usage: $command_name app_id command_to_execute"
    echo -e "\tExample: $command_name Firefox firefox   <-- Executes firefox or focuses it"
}

if  [[ $# -lt $expected_args ]]; then
    echo -e "[ERROR]: Expected at least $expected_args arguments but received $#."
    usage
    exit 1
fi

app_id="$1"
shift
cmd="$@"

if swaymsg -t get_tree | grep -q "\"app_id\": \"$app_id\""; then
    swaymsg [app_id="^${app_id}$"] focus
else
    $cmd
fi

exit 0



