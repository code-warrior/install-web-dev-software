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

show "This script will install, update, and configure files and applications "
show "that you will use in any HTML/CSS/JavaScript class that you take with me."

inform "Enter your computer’s password so that this script can make the " true
inform "necessary changes to your system. For security purposes, Mac OS "
inform "will not echo to The Terminal the password as you type: "

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
inform
inform "Checking the validity of this set up. If it is not valid, it will "
inform "fail or warn you."
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
   fail "(10.14). It may not work in previous versions, especially those"
   fail "from 2014 (10.10, Yosemite) or older. To be safe, exit this"
   fail "installation, update to Mojave, then restart this program."
   fail "Exiting..." true

   exit 1
fi

#####################################################################################
# Check for recommended software updates
#####################################################################################
inform "Running software update on Mac OS... " true
sudo softwareupdate -i -r --ignore iTunes > /dev/null 2>&1
show "Software updated!"

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
      fail "Sorry! You’ll have to upgrade your OS to $MINIMUM_MAC_OS or above." true;

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
source ./includes/install/ibm-plex-mono.sh
source ./includes/install/ubuntu-mono.sh

#####################################################################################
# Install linters
#####################################################################################
source ./includes/install/stylelintrc.json.sh

while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Using Sass? (y)es or (n)o. ${RESET}"  -n 1 -r SASS_RESPONSE

   case $SASS_RESPONSE in
      [yY]* )
         source ./includes/install/sass-lint.yml.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Using Sass? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Using JavaScript? (y)es or (n)o. ${RESET}"  -n 1 -r ESLINT_RESPONSE

   case $ESLINT_RESPONSE in
      [yY]* )
         source ./includes/install/eslintrc.json.sh

         break;;

      [nN]* )
         break;;

      * )
         echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Using JavaScript? (y)es, (n)o, or (q)uit. ${RESET} ";;
   esac
done

#####################################################################################
# Install environment
#####################################################################################
install_configuration_file "$GIT_PROMPT" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_PROMPT"
install_configuration_file "$GIT_COMPLETION" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_COMPLETION"
install_configuration_file "$BASH_ALIAS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIAS"
install_configuration_file "$BASH_RUN_COMMANDS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_RUN_COMMANDS"
install_configuration_file "$BASH_PFILE" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PFILE"
source ./includes/install/tomorrow-night.sh
source ./includes/install/editorconfig.sh

#####################################################################################
# Install software
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

source ./includes/install/spectacle.sh
source ./includes/install/typora.sh
source ./includes/install/github-desktop.sh
source ./includes/install/atom.sh

inform "The installation is complete. " true
inform "Open Spectacle’s Preferences pane and check off ‘Launch Spectacle at login’. "
inform "Please restart The Terminal and Spectacle."
