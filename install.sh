#!/usr/bin/env bash

#####################################################################################
# Linted at https://www.shellcheck.net/
#####################################################################################

# Set 256 color profile
export TERM=xterm-256color

source ./includes/globals/variables.sh
source ./includes/globals/functions.sh

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

if [ "$OS_NUMBER" -lt "11" ]; then
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
if [ -n "$(pkgutil --pkgs=com.apple.pkg.$cmdline_version)" ]; then
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
# Install the IBM Plex Mono typeface
#####################################################################################
if [ -e "$HOME/Library/Fonts/IBMPlexMono-Regular.ttf" ]; then
   inform "IBM Plex Mono Regular is already installed." true
   pause_and_warn
else
   inform "Downloading the IBM Plex Mono typeface..."
   curl "https://fonts.google.com/download?family=IBM%20Plex%20Mono" -o IBM_Plex_Mono.zip

   inform "Unzipping the IBM Plex Mono typeface..."
   unzip IBM_Plex_Mono.zip -d IBM_Plex_Mono

   inform "Installing the IBM Plex Mono typeface into Font Book..."
   mv IBM_Plex_Mono/*.ttf "$HOME/Library/Fonts/"

   inform "Removing un-needed IBM_Plex_Mono folder..." true
   rm -fr IBM_Plex_Mono

   inform "Removing un-needed IBM_Plex_Mono.zip file..." true
   rm -fr IBM_Plex_Mono.zip
fi

#####################################################################################
# Install the Ubunutu Mono typeface
#####################################################################################
if [ -e "$HOME/Library/Fonts/UbuntuMono-Regular.ttf" ]; then
   inform "Ubuntu Mono Regular is already installed." true
   pause_and_warn
else
   inform "Downloading the Ubuntu Mono typeface..."
   curl "https://fonts.google.com/download?family=Ubuntu%20Mono" -o Ubuntu_Mono.zip

   inform "Unzipping the Ubuntu Mono typeface into Font Book..."
   unzip Ubuntu_Mono.zip -d Ubuntu_Mono

   inform "Installing the Ubuntu Mono typeface into Font Book..."
   mv -v Ubuntu_Mono/*.ttf "$HOME/Library/Fonts/"

   inform "Removing Ubuntu_Mono folder..." true
   rm -fr Ubuntu_Mono

   inform "Removing Ubuntu_Mono.zip file..." true
   rm -fr Ubuntu_Mono.zip
fi

#####################################################################################
# Install .editorconfig file
#####################################################################################
if [ -e "$HOME/.editorconfig" ]; then
   pause_and_warn ".editorconfig file exists. Renaming to .backup.editorconfig" true
   mv -v "$HOME/.editorconfig" "$HOME/.backup.editorconfig"
fi

inform "Downloading .editorconfig..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/.editorconfig

inform "Installing .editorconfig..."
mv -v .editorconfig "$HOME/"

inform ".editorconfig downloaded and installed to $HOME/.editorconfig"

#####################################################################################
# Install .stylelintrc.json file
#####################################################################################
if [ -e "$HOME/.stylelintrc.json" ]; then
   pause_and_warn ".stylelintrc.json file exists. Renaming to .backup.stylelintrc.json" true
   mv -v "$HOME/.stylelintrc.json" "$HOME/.backup.stylelintrc.json"
fi

inform "Downloading .stylelintrc.json..."
curl -O https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/.stylelintrc.json

inform "Installing .stylelintrc.json..."
mv -v .stylelintrc.json "$HOME/"

inform ".stylelintrc.json downloaded and installed to $HOME/.stylelintrc.json"

#####################################################################################
# Install .sass-lint.yml file
#####################################################################################
if [ -e "$HOME/.sass-lint.yml" ]; then
   pause_and_warn ".sass-lint.yml file exists. Renaming to .backup.sass-lint.yml" true
   mv -v "$HOME/.sass-lint.yml" "$HOME/.backup.sass-lint.yml"
fi

inform "Downloading .sass-lint.yml..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/.sass-lint.yml

inform "Installing .sass-lint.yml..."
mv -v .sass-lint.yml "$HOME/"

inform ".sass-lint.yml downloaded and installed to $HOME/.sass-lint.yml"

#####################################################################################
# Install .git-prompt.sh file
#####################################################################################
if [ -e "$HOME/.git-prompt.sh" ]; then
   pause_and_warn ".git-prompt.sh file exists. Renaming to .backup.git-prompt.sh" true
   mv -v "$HOME/.git-prompt.sh" "$HOME/.backup.git-prompt.sh"
fi

inform "Downloading .git-prompt.sh..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/.git-prompt.sh

inform "Installing .git-prompt.sh..."
mv -v .git-prompt.sh "$HOME/"

inform ".git-prompt.sh downloaded and installed to $HOME/.git-prompt.sh"

#####################################################################################
# Install .git-completion.sh file
#####################################################################################
if [ -e "$HOME/.git-completion.sh" ]; then
   pause_and_warn ".git-completion.sh file exists. Renaming to .backup.git-completion.sh" true
   mv -v "$HOME/.git-completion.sh" "$HOME/.backup.git-completion.sh"
fi

inform "Downloading .git-completion.sh..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/.git-completion.sh

inform "Installing .git-completion.sh..."
mv -v .git-completion.sh "$HOME/"

inform ".git-completion.sh downloaded and installed to $HOME/.git-completion.sh"

#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [ -e "$HOME/.bash_aliases" ]; then
   pause_and_warn ".bash_aliases file exists. Renaming to .backup.bash_aliases" true
   mv -v "$HOME/.bash_aliases" "$HOME/.backup.bash_aliases"
fi

inform "Downloading .bash_aliases..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bash_aliases

inform "Installing .bash_aliases..."
mv -v .bash_aliases "$HOME/"

inform ".bash_aliases downloaded and installed to $HOME/.bash_aliases"

#####################################################################################
# Install .bashrc file
#####################################################################################
if [ -e "$HOME/.bashrc" ]; then
   pause_and_warn ".bashrc file exists. Renaming to .backup.bashrc" true
   mv -v "$HOME/.bashrc" "$HOME/.backup.bashrc"
fi

inform "Downloading .bashrc..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bashrc

inform "Installing .bashrc..."
mv -v .bashrc "$HOME/"

inform ".bashrc downloaded and installed to $HOME/.bashrc"

#####################################################################################
# Install .bash_profile file
#####################################################################################
if [ -e "$HOME/.bash_profile" ]; then
   pause_and_warn ".bash_profile file exists. Renaming to .backup.bash_profile" true
   mv -v "$HOME/.bash_profile" "$HOME/.backup.bash_profile"
fi

inform "Downloading .bash_profile..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bash_profile

inform "Installing .bash_profile..."
mv -v .bash_profile "$HOME/"

inform ".bash_profile downloaded and installed to $HOME/.bash_profile"

#####################################################################################
# Install Tomorrow Night Terminal theme
#####################################################################################
inform "Downloading TomorrowNight.terminal..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/TomorrowNight.terminal

open TomorrowNight.terminal

inform "Bring up The Terminal’s preferences by typing ⌘ + ,. Choose Profiles, " true
inform "which is the second tab on the top, then scroll all the way down along the "
inform "left column until you find TomorrowNight. Click Default, then close the "
inform "Profiles page."
pause_and_warn "Once the theme is installed, come back to this Terminal window."

inform "Removing un-needed TomorrowNight.terminal file..."
rm -f TomorrowNight.terminal

#####################################################################################
# Install Spectacle
#####################################################################################
if [ -d "/Applications/Spectacle.app/" ]; then
   inform "Spectacle is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Spectacle..."
   curl -O https://s3.amazonaws.com/spectacle/downloads/Spectacle+1.2.zip

   inform "Unzipping Spectacle..."
   unzip Spectacle+1.2.zip

   inform "Installing Spectacle into Applications..."
   mv -v Spectacle.app /Applications

   inform "Removing Spectacle’s .zip file..."
   rm -f Spectacle+1.2.zip

   inform "Launching Spectacle..." true
   open /Applications/Spectacle.app

   warn "If you’re running Spectacle for the first time, click Open System " true
   warn "Preferences, unlock the lock in the lower left corner of Security "
   warn "& Privacy (if it’s locked), and check the box to the left of the"
   warn "Spectacle icon. Lock the dialog box, then continue."
   pause_and_warn

   inform "Downloading custom Spectacle shortcuts..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/spectacle/Shortcuts.json

   inform "Installing custom Spectacle shortcuts..."
   mv -v Shortcuts.json ~/Library/Application\ Support/Spectacle/

   pause_and_warn "Restart Spectacle."
fi

#####################################################################################
# Install Typora
#####################################################################################
if [ -d "/Applications/Typora.app/" ]; then
   inform "Typora is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Typora..."
   curl -O https://typora.io/download/Typora.dmg

   inform "Installing Typora..."
   open Typora.dmg

   inform "The Finder should have loaded the Typora image. Copy Typora " true
   inform "to the Applications folder. Wait until the copy is finished before "
   inform "proceeding."
   pause_and_warn

   inform "Ejecting Typora Disc Image..." true
   diskutil eject /Volumes/Typora/

   inform "Removing Typora Disc Image..." true
   rm -f Typora.dmg

   inform "Typora’s installer image ejected and its installer removed." true
fi

#####################################################################################
# Install GitHub Desktop
#####################################################################################
if [ -d "/Applications/GitHub Desktop.app/" ]; then
   inform "GitHub Desktop is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading GitHub Desktop..."
   curl 'https://desktop.githubusercontent.com/releases/1.5.1-b1e34b0f/GitHubDesktop.zip' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://desktop.github.com/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o GitHubDesktop.zip

   inform "Unzipping GitHub Desktop... " true
   inform "Once the installer has been unzipped, move GitHub Desktop into the "
   inform "Applications folder, then, once it’s copied, return to this script "
   inform "and continue."
   open GitHubDesktop.zip
   pause_and_warn

   inform "Removing GitHubDesktop.zip..." true
   rm -f GitHubDesktop.zip

   inform "GitHub Desktop’s installer removed." true
fi

#####################################################################################
# Install Atom
#####################################################################################
if [ -d "/Applications/Atom.app/" ]; then
   inform "Atom is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Atom..."
   curl 'https://github-production-release-asset-2e65be.s3.amazonaws.com/3228505/70459a00-0399-11e9-96ae-993318bf6878?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20181229%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20181229T052242Z&X-Amz-Expires=300&X-Amz-Signature=2db44d5425ce311b7120dff71b612da87f80a894ecd78216b2e93a3ddf58f83c&X-Amz-SignedHeaders=host&actor_id=1843562&response-content-disposition=attachment%3B%20filename%3Datom-mac.zip&response-content-type=application%2Foctet-stream' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://github.com/atom/atom/releases/tag/v1.33.1' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o atom-mac.zip

   inform "Unzipping Atom... " true
   inform "Once the installer has been unzipped, move Atom into the Applications "
   inform "folder and launch it. Then, click Atom in the menu bar on the left, "
   inform "right next to the Apple icon, choose Install Shell Commands, and close"
   inform "Atom once you get confirmation. Return to this script and continue."
   open atom-mac.zip
   pause_and_warn

   inform "Removing atom-mac.zip..." true
   rm -f atom-mac.zip

   inform "Atom’s installer removed." true
fi

#####################################################################################
# Install Atom packages and config.cson
#####################################################################################
if [ -e "$HOME/.atom/config.cson" ]; then
   inform  "Atom’s config.cson file exists." true
   pause_and_warn

   inform "Renaming config.cson to .atom/backup.config.cson..."
   mv -v "$HOME/.atom/config.cson" "$HOME/.atom/backup.config.cson"
fi

inform "Downloading Atom’s config.cson..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/atom/config.cson

inform "Installing Atom’s config.cson..."
mv -v config.cson "$HOME/.atom/"

inform "Installing Atom packages..."
if [ -n "$(apm install)" ]; then
   apm install busy-signal
   apm install intentions
   apm install linter-ui-default
   apm install linter
   apm install editorconfig
   apm install w3c-validation
   apm install linter-stylelint
   apm install emmet
   apm install linter-sass-lint
else
   fail "Atom’s package manager (APM) is not installed. Launch Atom, " true
   fail "click Atom in the menu bar on the left, right next to the Apple icon,"
   fail "then choose Install Shell Commands. "
   fail "Close Atom, then restart this script. Exiting..." true

   exit 0
fi

inform "This script is complete. Please restart The Terminal."
