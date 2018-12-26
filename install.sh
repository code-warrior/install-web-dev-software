#!/usr/bin/env bash

SYSTEM="mac"
BASH_FILE=".bash_profile"
MINIMUM_MAC_OS="10.11.0"

# set 256 color profile where possible
if [[ $COLORTERM == gnome-* && $TERM == xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

# Reset formatting
RESET=$(      tput sgr0)

# Foreground color
BLACK=$(      tput setaf 0)
RED=$(        tput setaf 1)
GREEN=$(      tput setaf 2)
YELLOW=$(     tput setaf 3)
BLUE=$(       tput setaf 4)
MAGENTA=$(    tput setaf 5)
CYAN=$(       tput setaf 6)
WHITE=$(      tput setaf 7)

# Background color
BG_BLACK=$(   tput setab 0)
BG_RED=$(     tput setab 1)
BG_GREEN=$(   tput setab 2)
BG_YELLOW=$(  tput setab 3)
BG_BLUE=$(    tput setab 4)
BG_MAGENTA=$( tput setab 5)
BG_CYAN=$(    tput setab 6)
BG_WHITE=$(   tput setab 7)

# Style
UNDERLINE=$(  tput smul)
NOUNDERLINE=$(tput rmul)
BOLD=$(       tput bold)
ITALIC=$(     tput sitm)

function show () {
  echo -e "${BG_WHITE}${BLACK}> $* ${RESET}"
}

function inform () {
  if [[ $2 ]]; then echo ""; fi
  echo -e "${BG_GREEN}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function warn () {
  if [[ $2 ]]; then echo ""; fi
  echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
}

function fail () {
  if [[ $2 ]]; then echo ""; fi
  echo -e "${BG_RED}${WHITE}${BOLD}>>>>  $1 ${RESET}"
}

function pause_awhile () {
  if [[ $2 ]]; then echo ""; fi
  echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
  read -p "${BG_YELLOW}${BLACK}${BOLD}Press <Enter> to continue.${RESET}"
}

function pause_and_warn () {
  if [[ $2 ]]; then echo ""; fi
  echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>>  $1 ${RESET}"
  echo -e "${BG_YELLOW}${BLACK}${BOLD}>>>> ${RESET}"
  read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Continue? [Yy] ${RESET} " -n 1 -r

  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    fail "Exiting..." true
    exit 1;
  fi
}

show "This script will install, update, and configure files and applications "
show "that you will use in any HTML/CSS/JavaScript class that you take with me."

inform "Enter your computer’s password so that this script can make the " true
inform "necessary changes to your system. For security purposes, Mac OS "
inform "will not echo to The Terminal the password as you type: "

sudo -p "Password:" echo "${BG_WHITE}> Thank you! ${RESET}"

OS_VERSION=$(sw_vers -productVersion)

COMP_NAME=$(scutil --get ComputerName)
LOCL_NAME=$(scutil --get LocalHostName)
HOST_NAME=$(hostname)
USER_NAME=$(id -un)
FULL_NAME=$(finger "$USER_NAME" | awk '/Name:/ {print $4" "$5}')
USER_GRPS=$(id -Gn $USER_NAME)
OS_NUMBER=$(echo $OS_VERSION | cut -d "." -f 2)
MAC_ADDRS=$(ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')

DESCRIPTION=`cat << EOFS
      Computer Type:   Mac OS $OS_VERSION
      Short user name: $USER_NAME
      Long user name:  $FULL_NAME
      Computer name:   $COMP_NAME
      LocalHost name:  $LOCL_NAME
      Full Hostname:   $HOST_NAME
      Connection MAC:  $MAC_ADDRS
EOFS`

inform "Your current setup is:" true
printf "$DESCRIPTION\n"
inform "Checking the validity of this set up. If it is not valid, it will "
inform "fail or warn you."
echo "..."

#
# Check if current user is admin.
#
if echo "$USER_GRPS" | grep -q -w admin; then
  echo "" > /dev/null
else
  fail "The current user does not have administrator privileges. This " true
  fail "program must be run by a user with admin privileges."
  fail "Exiting..." true
  exit 1
fi

if [ "$OS_NUMBER" -lt "11" ]; then
  fail "This installation program was built and tested in macOS Mojave " true
  fail "(10.14). It may not work in previous versions, especially those"
  fail "from 2014 (10.10, Yosemite) or older. To be safe, exit this"
  fail "installation, update to Mojave, then restart this program."
  fail "Exiting..." true
  exit 1
fi

# Check for recommended software updates
inform "Running software update on Mac OS... " true
sudo softwareupdate -i -r --ignore iTunes > /dev/null 2>&1
show "Software updated!"

inform "Checking for XCode Command Line Tools..." true

# Check that command line tools are installed
case $OS_VERSION in
   *10.14*)
      cmdline_version="CLTools_Executables" ;; # Mojave
   *10.13*)
      cmdline_version="CLTools_Executables" ;; # High Sierra
   *10.12*)
      cmdline_version="CLTools_Executables" ;; # Sierra
   *10.11*)
      cmdline_version="CLTools_Executables"  # El Capitán
      pause_and_warn "Outdated OS. Consider upgrading before continuing." true;; # El Capitán
   *)
      fail "Sorry! You’ll have to upgrade your OS to $MINIMUM_MAC_OS or above." true;
      exit 1;;
esac

# Check for Command Line Tools based on OS versions
if [ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]; then
  show "Command Line Tools are installed!"
else
  fail "Command Line Tools are not installed!" true
  fail "Running 'xcode-select --install' Please click Install!"
  fail "After installing, please rerun this script."
  xcode-select --install
  exit 1
fi

inform "Setting OS configurations..." true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Only use UTF-8 in Terminal.app
sudo defaults write com.apple.terminal StringEncodings -array 4

show "Complete!"

#
# Install Typora for Markdown files, but first check if it is already installed.
#
if open -R "/Applications/Typora.app/"; then
   pause_and_warn "Typora is already installed on this machine." true
else
   inform "Downloading Typora..."
   curl -O https://typora.io/download/Typora.dmg
   inform "Installing Typora..."
   open Typora.dmg
   inform "The Finder should have loaded the Typora image. Copy Typora " true
   inform "to the Applications folder. Wait until the copy is finished before "
   inform "proceeding."
   pause_and_warn
   diskutil eject /Volumes/Typora/
   rm Typora.dmg
   inform "Typora’s installer image ejected and its installer removed."
fi

#
# Install the IBM Plex Mono typeface.
#
if [ -e ${HOME}/Library/Fonts/IBMPlexMono-Regular.ttf ]; then
   pause_and_warn "IBM Plex Mono Regular is already installed." true
else
   inform "Downloading the IBM Plex Mono typeface..."
   curl "https://fonts.google.com/download?family=IBM%20Plex%20Mono" -o IBM_Plex_Mono.zip

   inform "Unzipping the IBM Plex Mono typeface..."
   unzip IBM_Plex_Mono.zip -d IBM_Plex_Mono

   inform "Installing the IBM Plex Mono typeface into Font Book..."
   mv IBM_Plex_Mono/*.ttf ${HOME}/Library/Fonts/

   inform "Removing un-needed local folders and files related to IBM Plex Mono..."
   rm -fr IBM_Plex_Mono
   rm -fr IBM_Plex_Mono.zip
fi

#
# Install the Ubunutu Mono typeface.
#
if [ -e ${HOME}/Library/Fonts/UbuntuMono-Regular.ttf ]; then
   pause_and_warn "Ubuntu Mono Regular is already installed." true
else
   show "Downloading the Ubuntu Mono typeface..."
   curl "https://fonts.google.com/download?family=Ubuntu%20Mono" -o Ubuntu_Mono.zip

   show "Unzipping the Ubuntu Mono typeface into Font Book..."
   unzip Ubuntu_Mono.zip -d Ubuntu_Mono

   show "Installing the Ubuntu Mono typeface into Font Book..."
   mv Ubuntu_Mono/*.ttf ${HOME}/Library/Fonts/

   show "Removing un-needed local folders and files related to Ubuntu Mono..."
   rm -fr Ubuntu_Mono
   rm -fr Ubuntu_Mono.zip
fi
