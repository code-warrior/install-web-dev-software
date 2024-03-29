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
printf ">>>      Localhost name:  %s\n" "$LOCAL_HOST_NAME"
printf ">>>      Full hostname:   %s\n" "$HOST_NAME"
printf ">>>      Connection MAC:  %s\n" "$MAC_ADDRS"
inform
inform "Checking the validity of this set up. If it is not valid, it will "
inform "fail or warn you."
pause_and_warn

#####################################################################################
# Check if current user is admin
#####################################################################################
if echo "$GROUPS_TO_WHICH_USER_BELONGS" | grep -q -w admin; then
   echo "" > /dev/null
else
   fail "The current user does not have administrator privileges. This " true
   fail "program must be run by a user with admin privileges."
   fail "Exiting..." true

   exit 1
fi

#####################################################################################
# Check if macOS version is at least El Capitán (10.11.0)
#####################################################################################
if [[ "$MAJOR_NUMBER_OF_CURRENT_OS" -lt "$MINIMUM_MAJOR_NUMBER_REQUIRED" ]]; then
   fail "You are running a very old version of macOS, from about 2015. The " true
   fail "minimum version required to run the software installed by this script "
   fail "is $MINIMUM_MAJOR_NUMBER_REQUIRED.\
$MINIMUM_MINOR_NUMBER_REQUIRED.\
$MINIMUM_PATCH_NUMBER_REQUIRED. Your version is $OS_VERSION. Please update your OS to at least"
   fail "El Capitán and try again."
   fail
   fail "Exiting..."

   exit 1
else
   inform "This installation script was updated in Jan 2022 to work in macOS " true
   inform "Monterey (12.1). It may work in versions as early as macOS El Capitán "
   inform "(10.11.0). However, versions older than that are likely not compatible "
   inform "with this script and are unadvisable to use."
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

cmdline_version="CLTools_Executables"

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

while true
do
   read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  Using Sass? (y)es or (n)o. ${RESET}"  -n 1 -r SASS_RESPONSE

   case $SASS_RESPONSE in
      [yY]* )
         install_configuration_file "$SASS_LINT_SETTINGS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/"$SASS_LINT_SETTINGS"

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
         install_configuration_file "$ESLINT_SETTINGS" https://gist.githubusercontent.com/code-warrior/c6f1b02730b6a7d08c241f5bf1b62258/raw/2cdf414c31785847889697c67a7bd4bbad35393c/"$ESLINT_SETTINGS"

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
install_configuration_file "$EDITOR_CONFIG_SETTINGS" https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/"$EDITOR_CONFIG_SETTINGS"
source ./includes/install/tomorrow-night.sh

#####################################################################################
# Install software
#####################################################################################

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

source ./includes/install/rectangle.sh
source ./includes/install/github-desktop.sh
source ./includes/install/vs-code.sh

inform "The installation is complete. " true
