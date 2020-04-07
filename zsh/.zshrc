#############################################################################
##### 		ZSH and Oh-my-zsh setup requirements			#####
#############################################################################

export ZSH="/Users/quinnwinters/.oh-my-zsh"

ZSH_THEME="gallois"

HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
	brew
	docker
	git
	pyenv
	pylint
	sbt
	gradle
	tmux
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
source ~/.aliases

#############################################################################
##### 		Misc. Functions and shortcusts for zsh			#####
#############################################################################
export EDITOR='vim'


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



