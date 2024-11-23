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

# Static directories (oneoff whaler dir)
dirs=( ~/Downloads )

# Recursive subdirectories
fzf_dirs=( ~/work ~/personal )
fzf_dirs=$(find ${fzf_dirs[@]} -mindepth 1 -maxdepth 1 -type d)


# Append static dirs to found dirs
for d in ${fzf_dirs[@]}
do
    dirs[${#dirs[@]}]=$d
done

# To easily pipe it
pipe() {
    for d in ${dirs[@]}
    do
        echo $d
    done
}

selected=$(pipe | fzf --height=30% --layout=reverse --border=rounded --color=dark)

goTo "$selected"




