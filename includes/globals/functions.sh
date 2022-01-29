#!/usr/bin/env bash

function show () {
  echo -e "${BG_WHITE}${BLACK}> $* ${RESET}"
}

function inform () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_GREEN}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function warn () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function fail () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_RED}${WHITE}${BOLD}>>>>  $1 ${RESET}"
}

function pause_awhile () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"

   read -r -p "${BG_YELLOW}${BLACK}${BOLD}Press <Enter> to continue.${RESET}"
}

function pause_and_warn () {
   if [[ -n $2 ]]; then
      echo "";
   fi

   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
   echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>> ${RESET}"

   read -r -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Continue? [Yy] ${RESET} " -n 1 -r

   if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      fail "Exiting..." true

      exit 1;
   fi
}

function install_configuration_file() {
   if [[ -e "$HOME/$1" ]]; then
      if [[ -e "$HOME/.backup$1" ]]; then
         inform "$1 and .backup$1 exist." true
         inform "Nothing to install. Continuing..."
      else
         inform "$1 file exists." true
         pause_and_warn

         inform "Renaming to .backup$1..."
         mv -v "$HOME/$1" "$HOME/.backup$1"

         inform "Downloading $1..."
         curl -O "$2"

         if [[ -e "$1" ]]; then
            inform "$1 downloaded successfully."

            inform "Installing $1..."
            mv -v "$1" "$HOME/"

            if [[ -e "$1" ]]; then
               warn "$1 was not successfully installed. Please investigate, then continue."
               pause_and_warn
            else
               inform "$1 was installed successfully."
            fi
         fi
      fi
   else
      inform "Downloading $1..."
      curl -O "$2"

      if [[ -e "$1" ]]; then
         inform "$1 downloaded successfully."

         inform "Installing $1..."
         mv -v "$1" "$HOME/"

         if [[ -e "$1" ]]; then
            warn "$1 was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$1 was installed successfully."
         fi
      fi
   fi
}

function install_typeface () {
   if [[ -e "$HOME$1" ]]; then
      inform "$2 is already installed." true
      pause_and_warn
   else
      inform "Downloading the $2 typeface..."
      curl $3 -o "$4"

      inform "Unzipping the $2 typeface..."
      unzip "$4" -d "$5"

      inform "Installing the $2 typeface into Font Book..."
      mv "$5"/*.ttf "$HOME/Library/Fonts/"

      inform "Removing un-needed $5..." true
      rm -fr "$5"

      inform "Removing un-needed $4 file..." true
      rm -fr "$4"
   fi
}

function check_if_apm_package_exists () {
   if apm list | grep "$1@"; then
       inform "APM package $1 exists. Skipping..."
   else
       apm install "$1"
   fi
}
