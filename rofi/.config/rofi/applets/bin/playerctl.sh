#!/usr/bin/env bash

## Author  : Kulana Ryoseu
## Github  : @kryoseu
#
## Applets : Playerctl

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
status="$(playerctl status)"
if [[ -z "$status" ]]; then
  prompt='Offline'
  mesg="Playerctl is Offline"
else
  prompt="$(playerctl metadata xesam:artist)"
  mesg="$(playerctl metadata xesam:album) :: $(playerctl metadata xesam:title)"
fi

if [[ ("$theme" == *'type-1'*) || ("$theme" == *'type-3'*) || ("$theme" == *'type-5'*) ]]; then
  list_col='1'
  list_row='4'
elif [[ ("$theme" == *'type-2'*) || ("$theme" == *'type-4'*) ]]; then
  list_col='4'
  list_row='1'
fi

# Options
layout=$(cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
  if [[ ${status} == *"Playing"* ]]; then
    option_1=" Pause"
  else
    option_1=" Play"
  fi
  option_2=" Stop"
  option_3=" Previous"
  option_4=" Next"
else
  if [[ ${status} == *"Playing"* ]]; then
    option_1=""
  else
    option_1=""
  fi
  option_2=""
  option_3=""
  option_4=""
fi

# Rofi CMD
rofi_cmd() {
  rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
    -theme-str 'textbox-prompt-colon {str: "";}' \
    -dmenu \
    -p "$prompt" \
    -mesg "$mesg" \
    ${active} ${urgent} \
    -markup-rows \
    -theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Execute Command
run_cmd() {
  if [[ "$1" == '--opt1' ]]; then
    playerctl play-pause
  elif [[ "$1" == '--opt2' ]]; then
    playerctl stop
  elif [[ "$1" == '--opt3' ]]; then
    playerctl previous
  elif [[ "$1" == '--opt4' ]]; then
    playerctl next
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
$option_1)
  run_cmd --opt1
  ;;
$option_2)
  run_cmd --opt2
  ;;
$option_3)
  run_cmd --opt3
  ;;
$option_4)
  run_cmd --opt4
  ;;
$option_5)
  run_cmd --opt5
  ;;
$option_6)
  run_cmd --opt6
  ;;
esac
