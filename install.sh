#!/usr/bin/env bash

#####################################################################################
# Linted at https://www.shellcheck.net/
#####################################################################################

# Set 256 color profile
export TERM=xterm-256color

if [[ -e ./includes/globals/variables.sh ]]; then
   source ./includes/globals/variables.sh
else
   printf "The file variables.sh does not exist. This script requires it. Exiting...\n"

   exit 1
fi


if [[ -e ./includes/globals/functions.sh ]]; then
   source ./includes/globals/functions.sh
else
   printf "The file functions.sh does not exist. This script requires it. Exiting...\n"

   exit 1
fi

show "This script will install, update, and/or configure files and applications "
show "that you will use in this course."

inform "For this script to install the software required for this " true
inform "course, and for it to make course-related enhancements to "
inform "your system, it requires that you enter your computer’s "
inform "password. Your input is captured by your computer not this "
inform "script. For security purposes, macOS will not echo your "
inform "password to The Terminal as you type."

sudo -p "Password:" echo "${BG_WHITE}> Thank you! ${RESET}"

inform "Your current setup is:" true
inform
printf ">>>      Computer Type:   Mac OS %s\n" "$OS_VERSION"
printf ">>>      Short user name: %s\n" "$USER_NAME"
printf ">>>      Long user name:  %s\n" "$FULL_NAME"
printf ">>>      Computer name:   %s\n" "$COMP_NAME"
printf ">>>      Localhost name:  %s\n" "$LOCL_NAME"
printf ">>>      Full hostname:   %s\n" "$HOST_NAME"
printf ">>>      Connection MAC:  %s\n" "$MAC_ADDRS"
pause_and_warn

#####################################################################################
# Check if current user is admin
#####################################################################################
if echo "$USER_GRPS" | grep -q -w admin; then
   echo "" > /dev/null
else
   fail "The current user does not have administrator privileges. This " true
   fail "program must be run by a user with admin privileges."
   fail "Exiting..." true

   exit 1
fi

if [[ "$OS_NUMBER" -lt "11" ]]; then
   fail "This installation program was built and tested in macOS Mojave " true
   fail "(10.14.x). It may not work in previous versions, especially those"
   fail "from 2014 (10.10, Yosemite) or older. To be safe, exit this"
   fail "installation, update to Mojave, then restart this program."
   fail "Exiting..." true

   exit 1
fi

#####################################################################################
# Check for recommended software updates
#####################################################################################
inform "Running software update on macOS... " true
sudo softwareupdate -i -r --ignore iTunes > /dev/null 2>&1
show "Software update program has been run."

#####################################################################################
# Check that command line tools are installed
#####################################################################################
inform "Checking for XCode Command Line Tools..." true

case $OS_VERSION in
   *10.14*)
      cmdline_version="CLTools_Executables" ;; # Mojave
   *10.13*)
      cmdline_version="CLTools_Executables" ;; # High Sierra
   *10.12*)
      cmdline_version="CLTools_Executables" ;; # Sierra
   *10.11*)
      cmdline_version="CLTools_Executables"    # El Capitán
      pause_and_warn "Outdated OS. Consider upgrading before continuing." true;;
   *)
      fail "Sorry! You’ll have to upgrade your OS to $MINIMUM_MAC_OS or above to continue." true;

      exit 1;;
esac

#####################################################################################
# Check for Command Line Tools based on OS version
#####################################################################################
if [[ -n "$(pkgutil --pkgs=com.apple.pkg.$cmdline_version)" ]]; then
   show "Command Line Tools are installed!"
else
   fail "Command Line Tools are not installed!" true
   fail "Running 'xcode-select --install' Please click Install!"
   fail "After installing, please rerun this script." true
   xcode-select --install

   exit 1
fi

inform "Setting OS configurations..." true

#####################################################################################
# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
#####################################################################################
inform "Setting OS option that, when clicking the clock in the login window, " true
inform "reveals IP address, hostname, and OS version."
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

#####################################################################################
# Only use UTF-8 in The Terminal
#####################################################################################
inform "Setting OS option that accepts UTF-8 as input in The Terminal." true
sudo defaults write com.apple.terminal StringEncodings -array 4

#####################################################################################
# Install typefaces
#####################################################################################
install_typeface "/Library/Fonts/IBMPlexMono-Regular.ttf" "IBM Plex Mono" "https://fonts.google.com/download?family=IBM%20Plex%20Mono" "$IBM_PLEX_MONO_INSTALLER" "$IBM_PLEX_MONO_FOLDER"
install_typeface "/Library/Fonts/UbuntuMono-Regular.ttf" "Ubuntu Mono" "https://fonts.google.com/download?family=Ubuntu%20Mono" "$UBUNTU_MONO_INSTALLER" "$UBUNTU_MONO_FOLDER"

#####################################################################################
# Install linters
#####################################################################################
install_configuration_file "$STYLELINT_SETTINGS" https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/"$STYLELINT_SETTINGS"

#####################################################################################
# Install environment
#####################################################################################
install_configuration_file "$GIT_PROMPT" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_PROMPT"
install_configuration_file "$GIT_COMPLETION" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_COMPLETION"
install_configuration_file "$BASH_ALIAS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIAS"
install_configuration_file "$BASH_RUN_COMMANDS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_RUN_COMMANDS"
install_configuration_file "$BASH_PFILE" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PFILE"
install_configuration_file "$EDITOR_CONFIG_SETTINGS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/"$EDITOR_CONFIG_SETTINGS"
source ./includes/install/tomorrow-night.sh

#####################################################################################
# Install FileZilla
#####################################################################################
while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Using FileZilla? (y)es or (n)o. ${RESET}"  -n 1 -r FILEZILLA_RESPONSE

   case $FILEZILLA_RESPONSE in
      [yY]* )
         source ./includes/install/filezilla.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Using FileZilla? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

source ./includes/install/slack.sh
source ./includes/install/spectacle.sh
source ./includes/install/typora.sh
source ./includes/install/github-desktop.sh
source ./includes/install/atom.sh
#####################################################################################
# Install Slack
#####################################################################################
while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Need Slack? (y)es or (n)o. ${RESET}"  -n 1 -r SLACK_RESPONSE

   case $SLACK_RESPONSE in
      [yY]* )
         source ./includes/install/slack.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Need Slack? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

#####################################################################################
# Install Spectacle
#####################################################################################
while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Need Spectacle? (y)es or (n)o. ${RESET}"  -n 1 -r SPECTACLE_RESPONSE

   case $SPECTACLE_RESPONSE in
      [yY]* )
         source ./includes/install/spectacle.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Need Spectacle? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

#####################################################################################
# Install GitHub Desktop
#####################################################################################
while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Need GitHub Desktop? (y)es or (n)o. ${RESET}"  -n 1 -r GITHUB_DESKTOP_RESPONSE

   case $GITHUB_DESKTOP_RESPONSE in
      [yY]* )
         source ./includes/install/github-desktop.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Need GitHub Desktop? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

#####################################################################################
# Install Atom
#####################################################################################
while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Need Atom? (y)es or (n)o. ${RESET}"  -n 1 -r ATOM_RESPONSE

   case $ATOM_RESPONSE in
      [yY]* )
         source ./includes/install/atom.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Need Atom? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

inform "The installation is complete. " true
inform
inform "Open Spectacle’s Preferences pane and check off ‘Launch Spectacle at login’. "
inform "Please restart The Terminal and Spectacle."
