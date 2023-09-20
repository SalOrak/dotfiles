#!/bin/bash

dir=$(pwd)
# Check if it has at least 2 args
# Get the directory to pass to neovin
if [[ $# -eq 1 ]]; then
    if [[ -d "$(pwd)/$1" ]]; then
        echo "$(pwd)/$1" # Find directory in the current directory
        dir="$(pwd)/$1"
    elif [[ -d "$HOME/$1" ]]; then 
        echo "$HOME/$1"
        dir="$HOME/$1" # Find directory in the HOME directory
    elif [[ -d "/$1"  ]]; then
        echo "/$1"
        dir="/$1" # Find directory
    else
        echo "Directory $1 not found"
        exit 1
    fi
fi

leaf=${dir##*/} # Rightmost string after /

# Check if I'm inside tmux (or tmux is running)
tmux_running=$(pgrep tmux)

if  [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	# Tmux not running
	tmux new-session -c $dir -s $leaf  "nvim $dir" \; split-window -t $leaf -h -c $dir -l 40

	exit 0
else 
	echo "Creating new session"
	tmux new-session -d -c $dir -s $leaf  "nvim $dir" 

	while [[ $(tmux has-session -t=$leaf 2>/dev/null) ]]; do
		echo "Tmux does not have session $leaf"
	done

	echo "Splitting windows"
	tmux split-window -t $leaf -h -c $dir -l 40

	echo "Switching client"
	tmux switch-client -t $leaf
fi




    

