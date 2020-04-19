#!/bin/bash
COMMAND="$1"

# Generic flags
SHOULD_PRINT_HELP=false
SHOULD_FORCE_DO=false

# Installation flags
INSTALL_CORE=false
INSTALL_WORK=false
INSTALL_PERS=false
INSTALL_ALL=true

# configuration falgs
CONFIGURE_ALL=true
CONFIGURE_ZSH=false
CONFIGURE_TMUX=false
CONFIGURE_TODO=false
CONFIGURE_GIT=false
CONFIGURE_MAC=false
CONFIGURE_VIM=false
CONFIGURE_DRIVE=false

function start_task() {
  TASK_NAME="$1"
  printf ""
  printf "======================================================================"
  printf "     Starting Task: $TASK_NAME                                        "
  printf "======================================================================"
  printf ""
}

function end_task() {
  TASK_NAME="$1"
  printf ""
  printf "======================================================================"
  printf "     Finished Task: $TASK_NAME                                        "
  printf "======================================================================"
  printf ""
}

function print_help() {
  if [ "$1"=="install" ]; then
    printf "Usage for dotfiles install script:"
    printf "------------------------------------"
    printf ""
    printf "\t ./dotfiles.sh install [-c -w -p -a]"
    printf ""
    printf "\t\t -c --core \t\t Install core applications only"
    printf "\t\t -w --work \t\t Install work applications only"
    printf "\t\t -p --personal \t Install personal applications only"
    printf "\t\t -a --all \t\t Install all applications and run configurations"
    printf ""
    printf ""
    exit 0
  elif [ "$1"=="configure" ]; then
    printf "Usage for dotfiles configure script:"
    printf "------------------------------------"
    printf ""
    printf "\t ./dotfiles.sh configure [-z -t -g -m -v -i -f -d -a]"
    printf ""
    printf "\t\t -z --zsh \t\t\t Configure zsh and oh-my-zsh"
    printf "\t\t -t --tmux \t\t\t Configure tmux"
    printf "\t\t -g --git \t\t\t Configure gitignore and gitconfig"
    printf "\t\t -m --mac \t\t\t Configure macos core settings"
    printf "\t\t -v --vim \t\t\t Configure vim and various vim plugins"
    printf "\t\t -d --google-drive\t Configure Google Drive file mount"
    printf "\t\t -x --todo-txt \t\t Configure todo.txt system"
    printf "\t\t -a --all \t\t Configure all settings"
    exit 0
  else
    printf "Please use ./dotfiles.sh install --help or ./dotfiles.sh configure --help for usage"
    exit 0
  fi
}

while test $; do
  case "$1" in
    -c | --core)
      INSTALL_CORE=true
      ;;
    -w | --work)
      INSTALL_WORK=true
      ;;
    -p | --personal)
      INSTALL_PERS=true
      ;;
    -a | --all)
      INSTALL_ALL=true
      CONFIGURE_ALL=true
      ;;
    -z | --zsh)
      CONFIGURE_ZSH=true
      ;;
    -t | --tmux)
      CONFIGURE_TMUX=true
      ;;
    -g | --git)
      CONFIGURE_GIT=true
      ;;
    -m | --mac)
      CONFIGURE_MAC=true
      ;;
    -v | --vim)
      CONFIGURE_VIM=true
      ;;
    -d | --google-drive)
      CONFIGURE_DRIVE=true
      ;;
    -h | --help)
      SHOULD_PRINT_HELP=true
      ;;
    *)
      break
      ;;
  esac
done

function configure() {
  if "$CONFIGURE_VIM" || "$CONFIGURE_ALL"; then
    start_task "Configure - VIM"
    sh ./vim/_setup.sh
    end_task "Configure - VIM"
  fi

  if "$CONFIGURE_TMUX" || "$CONFIGURE_ALL"; then
    start_task "Configure - TMUX"
    sh ./tmux/_setup.sh
    end_task "Configure - TMUX"
  fi

  if "$CONFIGURE_GIT" || "$CONFIGURE_ALL"; then
    start_task "Configure - GIT"
    sh ./git/_setup.sh
    end_task "Configure - GIT"
  fi

  if "$CONFIGURE_MAC" || "$CONFIGURE_ALL"; then
    start_task "Configure - MAC"
    sh ./macos/_setup.sh
    end_task "Configure - MAC"
  fi

  if "$CONFIGURE_DRIVE" || "$CONFIGURE_ALL"; then
    start_task "Configure - GOOGLE DRIVE FILE SYSTEM"
    sh ./google-drive/_setup.sh
    end_task "Configure - GOOGLE DRIVE FILE SYSTEM"
  fi

  if "$CONFIGURE_ZSH" || "$CONFIGURE_ALL"; then
    start_task "Configure - ZSH"
    sh ./zsh/_setup.sh
    end_task "Configure - ZSH"
  fi

  if "$CONFIGURE_TODO" || "$CONFIGURE_ALL"; then
    start_task "Configure - TODO.TXT"
    sh ./todo/_setup.sh
    end_task "Configure - TODO.TXT"
  fi
}

function install() {
  if "$INSTALL_ALL"; then
    start_task "Install - ALL"
    setup_brew
    all_brew
    brew_bundle
    end_task "Install - ALL"
  else
    if "$INSTALL_CORE"; then
      start_task "Install - CORE"
      setup_brew
      core_brew
      brew_bundle
      end_task "Install - CORE"
    elif "$INSTALL_WORK"; then
      start_task "Install - WORK"
      setup_brew
      work_brew
      brew_bundle
      end_task "Install - WORK"
    elif "$INSTALL_PERS"; then
      start_task "Install - PERSONAL"
      setup_brew
      personal_brew
      brew_bundle
      end_task "Install - PERSONAL"
    fi
  fi
  printf "Got to the configure portion $CONFIGURE_ALL"
  configure
}

if [ "$COMMAND" == "install" ]; then
  install
elif [ "$COMMAND" == "configure" ]; then
  configure
else
  print_help
fi
