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

show "This script will uninstall the IBM Plex Mono font."

inform "Enter your computer’s password so that this script can make the " true
inform "necessary changes to your system. For security purposes, Mac OS "
inform "will not echo to The Terminal the password as you type: "

sudo -p "Password:" echo "${BG_WHITE}> Thank you! ${RESET}"

#####################################################################################
# Uninstall the IBM Plex Mono typeface.
#####################################################################################
if [ -e "$HOME/Library/Fonts/IBMPlexMono-Bold.ttf" ]; then
   inform "Removing IBMPlexMono-Bold.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Bold.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-BoldItalic.ttf" ]; then
   inform "Removing IBMPlexMono-BoldItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-BoldItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-ExtraLight.ttf" ]; then
   inform "Removing IBMPlexMono-ExtraLight.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-ExtraLight.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-ExtraLightItalic.ttf" ]; then
   inform "Removing IBMPlexMono-ExtraLightItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-ExtraLightItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-Italic.ttf" ]; then
   inform "Removing IBMPlexMono-Italic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Italic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-Light.ttf" ]; then
   inform "Removing IBMPlexMono-Light.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Light.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-LightItalic.ttf" ]; then
   inform "Removing IBMPlexMono-LightItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-LightItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-Medium.ttf" ]; then
   inform "Removing IBMPlexMono-Medium.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Medium.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-MediumItalic.ttf" ]; then
   inform "Removing IBMPlexMono-MediumItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-MediumItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-Regular.ttf" ]; then
   inform "Removing IBMPlexMono-Regular.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Regular.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-SemiBold.ttf" ]; then
   inform "Removing IBMPlexMono-SemiBold.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-SemiBold.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-SemiBoldItalic.ttf" ]; then
   inform "Removing IBMPlexMono-SemiBoldItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-SemiBoldItalic.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-Thin.ttf" ]; then
   inform "Removing IBMPlexMono-Thin.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-Thin.ttf"
fi

if [ -e "$HOME/Library/Fonts/IBMPlexMono-ThinItalic.ttf" ]; then
   inform "Removing IBMPlexMono-ThinItalic.ttf..." true
   rm -f "$HOME/Library/Fonts/IBMPlexMono-ThinItalic.ttf"
fi

show "IBM Plex Mono has been uninstalled partially, completely, or not"
show "at all, depending on the output above. If you uninstalled IBM"
show "Plex Mono in error, you may reinstall it by visiting"
show "https://fonts.google.com/specimen/IBM+Plex+Mono"
