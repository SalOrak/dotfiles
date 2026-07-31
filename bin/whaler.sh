# Static directories (oneoff whaler dir)
STATIC_DIRS=(
	~/personal/dotfiles/files/neovim
	~/personal/dotfiles/files/helix
)

PARENT_DIRS=(
	~/personal 
	~/gamedev 
	~/gamedev/Games
)

all_dirs=()

whaler_generate_directories() {

	# Recursive subdirectories
	fzf_dirs=$(find ${PARENT_DIRS[@]} -mindepth 1 -maxdepth 1 -type d 2>/dev/null)

	for d in ${STATIC_DIRS[@]}
	do
		all_dirs[${#all_dirs[@]}]=$d
	done

	# Append static dirs to found dirs
	for d in ${fzf_dirs[@]}
	do
		all_dirs[${#all_dirs[@]}]=$d
	done
}


display_help() {
	printf "Usage: source whaler.sh [[-p]] \n\n"
	printf "Searches and changes directory based on a list of directories using fzf as the backend\n."
	printf "\t -p, --print-only\n\t\tIt does not modify the current working directory,\n\t\tinstead it outputs the absolute path of the selected project."
	printf "\n\n"
}

# In order to works it must be executed in the same shell ( source or (.) )
goTo() {
	choice=$(echo "$1" | tr -d '\n')
    if [[ -d "$choice" ]]; then
		if [[ $PRINT_ONLY -eq 1 ]] then
			echo "$choice"
		else 
			WHALER_LAST=$WHALER_CURRENT
			WHALER_CURRENT=$choice
			cd "$choice"
		fi
    fi
}

# To easily pipe it
pipe() {
	whaler_generate_directories
    for d in ${all_dirs[@]}
    do
        echo $d
    done
}

PRINT_ONLY=0

while [[ "$1" =~ ^- &&  "$1" != "--" ]]; 
do 
	case $1 in
		-h | --help)
			display_help 
			return
			;;
		-p | --print-only)
			shift; PRINT_ONLY=1
			;;
    esac; 
	shift; 
done

selected=$(pipe | fzf --height=30% --layout=reverse --border=rounded --color=dark)

goTo "$selected"

