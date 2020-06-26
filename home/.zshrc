# ========================================================= #
# |     OH-MY-ZSH SETUP AND BASIC SOURCING                | #
# ========================================================= #
export ZSH="/Users/quinnwinters/.oh-my-zsh"

ZSH_THEME="ys"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=( git )

source ~/.bashrc
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
source ~/.zaliases
source ~/.zcompletions

# the idea here is that other directories can specify aliases that you might
# what for specific programs, independently add them to this aliases directory
# and zsh will pick them up on reload
if [[ -d ~/.aliases ]] ; then 
  for f in ~/.aliases/* ; do source $f; done
fi

# ========================================================= #
# |     MISC FUNCTIONS THAT WILL PROBABLY BE USED OFTEN   | #
# ========================================================= #
function psgrep() { ps auxf | grep -v grep GREP "$@" }
function search() { find . -iname "*$@*" LESS }
function up() {
  if [[ "$#" < 1 ]] ; then
    cd ..
  else
    CDSTR=""
    for i in {1..$1} ; do
      CDSTR="../$CDSTR"
    done
    cd $CDSTR
  fi
}
