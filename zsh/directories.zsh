# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups

setopt auto_cd
cdpath=(. $HOME $HOME/Projects/sites $HOME/Projects/spartan $HOME/Projects)

# mkdir & cd to it
function mcd() { 
  mkdir -p "$1" && cd "$1"; 
}
