#!/bin/bash 


# In order to works it must be executed in the same shell ( source or (.) )


goTo() {
    if [[ -d $1 ]];then
        echo "Entering into $1..."
        cd $1
    fi
}

# Pass directly a dir to go to
if [[ -d $1 ]]; then
    selected=$1
fi

dirs=( ~/work ~/personal )

selected=$(find ${dirs[@]} -mindepth 1 -maxdepth 1 -type d \
    | fzf --scheme=path --height=30% --layout=reverse --border=rounded --separator='-' --color=dark)

goTo "$selected"




