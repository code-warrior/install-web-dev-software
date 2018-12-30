#!/usr/bin/env bash

RESET=$(tput sgr0)
BLACK=$(tput setaf 0)
BG_GREEN=$(tput setab 2)
BG_WHITE=$(tput setab 7)
BOLD=$(tput bold)

function show () {
  echo -e "${BG_WHITE}${BLACK}> $* ${RESET}"
}

function inform () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_GREEN}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

show "This script will uninstall the Ubuntu Mono font."

inform "Enter your computer’s password so that this script can make the " true
inform "necessary changes to your system. For security purposes, Mac OS "
inform "will not echo to The Terminal the password as you type: "

sudo -p "Password:" echo "${BG_WHITE}> Thank you! ${RESET}"

#####################################################################################
# Uninstall the Ubunutu Mono typeface.
#####################################################################################
if [ -e "$HOME/Library/Fonts/UbuntuMono-Bold.ttf" ]; then
   inform "Removing UbuntuMono-Bold.ttf..." true
   rm -f "$HOME/Library/Fonts/UbuntuMono-Bold.ttf"
fi

if [ -e "$HOME/Library/Fonts/UbuntuMono-BoldItalic.ttf" ]; then
   inform "Removing UbuntuMono-BoldItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/UbuntuMono-BoldItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/UbuntuMono-Italic.ttf" ]; then
   inform "Removing UbuntuMono-Italic.ttf..." true
   rm -f "$HOME/Library/Fonts/UbuntuMono-Italic.ttf"
fi

if [ -e "$HOME/Library/Fonts/UbuntuMono-Regular.ttf" ]; then
   inform "Removing UbuntuMono-Regular.ttf..." true
   rm -f "$HOME/Library/Fonts/UbuntuMono-Regular.ttf"
fi

show "Ubunutu Mono has been uninstalled partially, completely, or not"
show "at all, depending on the output above. If you uninstalled Ubuntu"
show "Mono in error, you may reinstall it by visiting"
show "https://fonts.google.com/specimen/Ubuntu+Mono"
