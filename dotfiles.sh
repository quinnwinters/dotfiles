#!/bin/bash
COMMAND=$1

# Generic flags
SHOULD_PRINT_HELP=false
SHOULD_FORCE_DO=false

# Installation flags
INSTALL_CORE=false
INSTALL_WORK=false
INSTALL_PERS=false
INSTALL_ALL=false

# configuration falgs
CONFIGURE_ALL=false
CONFIGURE_ZSH=false
CONFIGURE_TMUX=false
CONFIGURE_TODO=false
CONFIGURE_GIT=false
CONFIGURE_MAC=false
CONFIGURE_VIM=false
CONFIGURE_DRIVE=false

function start_task() {
  TASK_NAME="$1"

  echo ""
  echo "======================================================================"
  echo "     Starting Task: $TASK_NAME                                        "
  echo "======================================================================"
  echo ""

}

function end_task() {
  TASK_NAME="$1"

  echo ""
  echo "======================================================================"
  echo "     Finished Task: $TASK_NAME                                        "
  echo "======================================================================"
  echo ""

}

function print_help() {
  if [ "$1"=="install" ]; then
    echo "Usage for dotfiles install script:"
    echo "------------------------------------"
    echo ""
    echo "\t ./dotfiles.sh install [-c -w -p -a]"
    echo ""
    echo "\t\t -c --core \t\t Install core applications only"
    echo "\t\t -w --work \t\t Install work applications only"
    echo "\t\t -p --personal \t Install personal applications only"
    echo "\t\t -a --all \t\t Install all applications and run configurations"
    echo ""
    echo ""
    exit 0
  elif [ "$1"=="configure" ]; then
    echo "Usage for dotfiles configure script:"
    echo "------------------------------------"
    echo ""
    echo "\t ./dotfiles.sh configure [-z -t -g -m -v -i -f -d -a]"
    echo ""
    echo "\t\t -z --zsh \t\t\t Configure zsh and oh-my-zsh"
    echo "\t\t -t --tmux \t\t\t Configure tmux"
    echo "\t\t -g --git \t\t\t Configure gitignore and gitconfig"
    echo "\t\t -m --mac \t\t\t Configure macos core settings"
    echo "\t\t -v --vim \t\t\t Configure vim and various vim plugins"
    echo "\t\t -d --google-drive\t Configure Google Drive file mount"
    echo "\t\t -x --todo-txt \t\t Configure todo.txt system"
    echo "\t\t -a --all \t\t Configure all settings"
    exit 0
  else
    echo "Please use ./dotfiles.sh install --help or ./dotfiles.sh configure --help for usage"
    echo 0
  fi
}

while test $
do
    case "$1" in
    -c|--core)
      INSTALL_CORE=true
      ;;
    -w|--work)
      INSTALL_WORK=true
      ;;
    -p|--personal)
      INSTALL_PERS=true
      ;;
    -a|--all)
      INSTALL_ALL=true
      CONFIGURE_ALL=true
      ;;
    -z|--zsh)
      CONFIGURE_ZSH=true
      ;;
    -t|--tmux)
      CONFIGURE_TMUX=true
      ;;
    -g|--git)
      CONFIGURE_GIT=true
      ;;
    -m|--mac)
      CONFIGURE_MAC=true
      ;;
    -v|--vim)
      CONFIGURE_VIM=true
      ;;
    -f|--firefox)
      CONFIGURE_FIREFOX=true
      ;;
    -d|--google-drive)
      CONFIGURE_DRIVE=true
      ;;
    -x|--todo-txt)
      CONFIGURE_TODO=true
      ;;
    -h|--help)
      print_help "$COMMAND"
      ;;
    *)
      break
      ;;
  esac
done

function configure() {
  if $CONFIGURE_VIM || $CONFIGURE_ALL ; do
    start_task "Configure - VIM"
    sh ./vim/_setup.sh
    end_task "Configure - VIM"
  fi

  if $CONFIGURE_TMUX || $CONFIGURE_ALL ; do
    start_task "Configure - TMUX"
    sh ./tmux/_setup.sh
    end_task "Configure - TMUX"
  fi

  if $CONFIGURE_GIT || $CONFIGURE_ALL ; do
    start_task "Configure - GIT"
    sh ./git/_setup.sh
    end_task "Configure - GIT"
  fi

  if $CONFIGURE_MAC || $CONFIGURE_ALL ; do
    start_task "Configure - MAC"
    sh ./macos/_setup.sh
    end_task "Configure - MAC"
  fi

  if $CONFIGURE_DRIVE || $CONFIGURE_ALL ; do
    start_task "Configure - GOOGLE DRIVE FILE SYSTEM"
    sh ./google-drive/_setup.sh
    end_task "Configure - GOOGLE DRIVE FILE SYSTEM"
  fi

  if $CONFIGURE_ZSH || $CONFIGURE_ALL ; do
    start_task "Configure - ZSH"
    sh ./zsh/_setup.sh
    end_task "Configure - ZSH"
  fi

  if $CONFIGURE_TODO || $CONFIGURE_ALL ; do
    start_task "Configure - TODO.TXT"
    sh ./todo/_setup.sh
    end_task "Configure - TODO.TXT"
  fi
}

function install() {
  if $INSTALL_ALL ; then
    start_task "Install - ALL"
    setup_brew
    all_brew
    brew_bundle
    end_task "Install - ALL"
  else
    if $INSTALL_CORE ; then
      start_task "Install - CORE"
      setup_brew
      core_brew
      brew_bundle
      end_task "Install - CORE"
    elif $INSTALL_WORK ; then
      start_task "Install - WORK"
      setup_brew
      work_brew
      brew_bundle
      end_task "Install - WORK"
    elif $INSTALL_PERS ; then
      start_task "Install - PERSONAL"
      setup_brew
      personal_brew
      brew_bundle
      end_task "Install - PERSONAL"
    fi
  fi

  configure
}

if [ $COMMAND == "install" ]; then
  install
elif [ $COMMAND == "configure" ]; then
  configure
else
  print_help
fi
