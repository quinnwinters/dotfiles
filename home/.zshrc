# ========================================================= #
# |     OH-MY-ZSH SETUP AND BASIC SOURCING                | #
# ========================================================= #
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=( git )

SPACESHIP_PROMPT_ORDER=(
  user
  host
  dir
  exit_code
  char
)

SPACESHIP_RPROMPT_ORDER=(
  time
  git
  node
  venv
  pyenv
  conda
  docker
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=needed
SPACESHIP_HOST_PREFIX="@ "
SPACESHIP_DIR_PREFIX=""
SPACESHIP_GIT_SYMBOL="• "
SPACESHIP_NODE_SYMBOL="node.js "
SPACESHIP_DOCKER_SYMBOL="docker "
SPACESHIP_AWS_SHOW=false
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_CONDA_SYMBOL="conda "
SPACESHIP_PYENV_SYMBOL="py "
SPACESHIP_VENV_SYMBOL="venv "

<<<<<<< HEAD
if [[ ! -d $HOME/.venv ]] ; then
  mkdir -p $HOME/.venv
fi

if [[ ! -d $HOME/.venv/base ]] ; then
  pythbin=$(which python)
  pyloc=$(dirname $pythbin)
  $pyloc/pip3 install virtualenv
  $pyloc/python3 -m virtualenv ~/.venv/base
fi

source $HOME/.venv/base/bin/activate
source $HOME/.bash_profile
=======
if [[ ! -d $HOME/.venv ]] ; then
  mkdir -p $HOME/.venv
fi

if [[ ! -d $HOME/.venv/base ]] ; then
  pythbin=$(which python)
  pyloc=$(dirname pythbin)
  $pyloc/pip install virtualenv
  $pyloc/python virtualenv ~/.venv/base
fi

source $HOME/.venv/base/bin/activate
>>>>>>> d4c6529... feat: adding a base python environment + new apps
source $HOME/.bashrc
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
source $HOME/.zaliases
source $HOME/.zcompletions

# the idea here is that other directories can specify aliases that you might
# what for specific programs, independently add them to this aliases directory
# and zsh will pick them up on reload
if [[ -d ~/.aliases ]] ; then
  for f in ~/.aliases/**/* ; do source $f; done
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

# Source work specific information which should be added on work computers only in the work/ folder
if [[ -d ~/.work/sourceable ]] ; then
  for f in ~/.work/sourceable/* ; do source $f ; done
fi
