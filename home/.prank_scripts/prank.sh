#!/bin/bash

SUPPORTED_SCRIPTS="bee, bee movie, mean girls"

function HELPER_get_prank_script_for_arg() {
  local script=`echo "$1" | tr '[:upper:]' '[:lower:]'`
  case $script in
    *"bee"*) return "$DOT_DIR/.prank_text/bee.txt" ;;
    *"mean"*) return "$DOT_DIR/.prank_text/meangirls.txt" ;;
  esac
}

function HELPER_list_include_item() {
  local list = "$1"
  local item = "$2"

  if [[ $list =~ (^|[[:space:]])"${item^h}"($|[[:space:]]) ]] ; then
    result=0
  else
    result=1
  fi
  return result
}

function HELPER_print_prank_confirimation() {
  echo "Sending $1 the entire text of $2 over $3"
}

function HELPER_prank_whatsapp_with_script() {
  local person="$1"
  local script="$2"

  if [[ $(HELPER_list_include_item "$SUPPORTED_SCRIPTS" "$script") ]] ; then
    curdir=$(pwd)
    cd $DOT_DIR/.prank_scripts/whatsapp
    textfile = HELPER_get_prank_script_for_arg "$script"
    while read msg; do
        osascript whatsapp.scpt "$person" "$msg"
    done << $textfile
    HELPER_print_prank_confirimation "$person" "$script" "WhatsApp"
    cd $curdir
    return 0
  else
    echo "Script not found"
    cd $curdir
    return 1
  fi
}

function HELPER_prank_imessage_with_script() {
  local person="$1"
  local script="$2"

  if [[ $(HELPER_list_include_item "$SUPPORTED_SCRIPTS" "$script") ]] ; then
    curdir=$(pwd)
    cd ~/.prank_scripts/whatsapp
    textfile = HELPER_get_prank_script_for_arg "$script"
    HELPER_print_prank_confirimation "$person" "$script" "iMessage"
    cd $curdir
    return 0
  else
    echo "Script not found"
    cd $curdir
    return 1
  fi
}

# alias prankWhatsApp="HELPER_prank_whatsapp_with_script"
alias prankIMessage="HELPER_prank_imessage_with_script"
