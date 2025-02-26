
dots="DOTS"
shadows="/home/hector/work/shadows/"

if [[ $(uname) == "Darwin" ]]; then
    dots="${dots}_MAC"
fi

# First we execute and install the everything
 ./configure.sh INSTALL --dotfiles $dots

# Then, install the shadow files
./configure.sh INSTALL --dotfiles "$shadows$dots" --start-dir "$shadows"


