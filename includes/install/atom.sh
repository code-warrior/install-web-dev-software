#####################################################################################
# Install Atom
#####################################################################################
if [[ -d "/Applications/Atom.app/" ]]; then
   inform "Atom is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Atom..."
   curl 'https://atom-installer.github.com/v1.33.1/atom-mac.zip?s=1545258140&ext=.zip' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3657.0 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://atom.io/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o "$ATOM_INSTALLER"

   inform "Unzipping Atom... " true
   inform "Once the install has been unzipped, move Atom into the Applications "
   inform "folder and launch it. Then, click Atom in the menu bar on the left, "
   inform "right next to the Apple icon, choose Install Shell Commands, and close"
   inform "Atom once you get confirmation. Return to this script and continue."
   open "$ATOM_INSTALLER"
   pause_and_warn

   if [[ -e "$ATOM_INSTALLER" ]]; then
      inform "Removing $ATOM_INSTALLER..." true

      rm -f "$ATOM_INSTALLER"

      if [[ -e "$ATOM_INSTALLER" ]]; then
         warn "Removing $ATOM_INSTALLER was not successful. Please remove manually." true
      else
         inform "Atom’s installer removed succesfully." true
      fi
   else
      warn "$ATOM_INSTALLER does not exist. Thus, there’s nothing to remove. Continuing..."
   fi
fi

#####################################################################################
# Install Atom’s config.cson
#####################################################################################
if [[ -e "$HOME/.atom/$ATOM_CONFIG" ]]; then
   inform  "Atom’s $ATOM_CONFIG file exists." true
   pause_and_warn

   inform "Renaming config.cson to .atom/backup.config.cson..."
   mv -v "$HOME/.atom/$ATOM_CONFIG" "$HOME/.atom/backup$ATOM_CONFIG"
fi

inform "Downloading Atom’s $ATOM_CONFIG..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/atom/config.cson

inform "Installing Atom’s $ATOM_CONFIG..."
mv -v config.cson "$HOME/.atom/"

#####################################################################################
# Install Atom packages
#####################################################################################
inform "Installing Atom packages..."
if [[ -n "$(apm install)" ]]; then
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
   fail "Atom’s package manager (APM) is not installed." true
   fail "1. Launch Atom."
   fail "2. Click Atom in the menu bar on the left, next to the Apple icon."
   fail "3. Choose Install Shell Commands."
   fail "4. Close Atom."
   fail "5. Restart this script." true

   exit 0
fi
