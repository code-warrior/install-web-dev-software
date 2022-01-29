#!/usr/bin/env bash

#####################################################################################
# Install Atom
#####################################################################################
if [[ -d "/Applications/Atom.app/" ]]; then
   inform "Atom is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Atom..."
   curl 'https://atom-installer.github.com/v1.58.0/atom-mac.zip?s=1627025609&ext=.zip' -H 'authority: atom-installer.github.com' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'sec-fetch-site: cross-site' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'sec-fetch-dest: document' -H 'sec-ch-ua: " Not;A Brand";v="99", "Google Chrome";v="97", "Chromium";v="97"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "macOS"' -H 'referer: https://atom.io/' -H 'accept-language: en-US,en;q=0.9' --compressed -o "$ATOM_INSTALLER"

   inform "Unzipping Atom... " true
   inform "Once the install has been unzipped, move Atom into the Applications "
   inform "folder and launch it. Then, click Atom in the menu bar on the left, "
   inform "next to the Apple icon, choose Install Shell Commands, and close"
   inform "Atom once you get confirmation. Return to this script and continue."
   open "$ATOM_INSTALLER"
   pause_and_warn

   if [[ -e "$ATOM_INSTALLER" ]]; then
      inform "Removing $ATOM_INSTALLER..." true

      rm -f "$ATOM_INSTALLER"

      if [[ -e "$ATOM_INSTALLER" ]]; then
         warn "Removing $ATOM_INSTALLER was not successful. Please remove manually." true
      else
         inform "Atom’s installer removed successfully." true
      fi
   else
      warn "$ATOM_INSTALLER does not exist. Thus, there’s nothing to remove. Continuing..."
   fi
fi

#####################################################################################
# Install Atom’s config.cson
#####################################################################################
if [[ -e "$HOME/.atom/$ATOM_CONFIG" ]]; then
   if [[ -e "$HOME/.atom/.backup.$ATOM_CONFIG" ]]; then
      inform ".atom/$ATOM_CONFIG and .atom/.backup.$ATOM_CONFIG exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$ATOM_CONFIG file exists." true
      pause_and_warn

      inform "Renaming to .atom/.backup.$ATOM_CONFIG..."
      mv -v "$HOME/.atom/$ATOM_CONFIG" "$HOME/.atom/.backup.$ATOM_CONFIG"

      inform "Downloading $ATOM_CONFIG..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/atom/"$ATOM_CONFIG"

      if [[ -e "$ATOM_CONFIG" ]]; then
         inform "$ATOM_CONFIG downloaded successfully."

         inform "Installing $ATOM_CONFIG..."
         mv -v "$ATOM_CONFIG" "$HOME/.atom/"

         if [[ -e "$ATOM_CONFIG" ]]; then
            fail "$ATOM_CONFIG was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$ATOM_CONFIG was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $ATOM_CONFIG..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/atom/"$ATOM_CONFIG"

   if [[ -e "$ATOM_CONFIG" ]]; then
      inform "$ATOM_CONFIG downloaded successfully."

      inform "Installing $ATOM_CONFIG..."
      mv -v "$ATOM_CONFIG" "$HOME/.atom/"

      if [[ -e "$ATOM_CONFIG" ]]; then
         fail "$ATOM_CONFIG was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$ATOM_CONFIG was installed successfully."
      fi
   fi
fi

#####################################################################################
# Install Atom packages
#####################################################################################
inform "Installing Atom packages..."
if [[ -n "$(apm install)" ]]; then
   check_if_apm_package_exists "busy-signal"
   check_if_apm_package_exists "intentions"
   check_if_apm_package_exists "linter-ui-default"
   check_if_apm_package_exists "linter"
   check_if_apm_package_exists "editorconfig"
   check_if_apm_package_exists "w3c-validation"
   check_if_apm_package_exists "linter-stylelint"
   check_if_apm_package_exists "emmet"

   if [[ $SASS_RESPONSE == 'y' || $SASS_RESPONSE == 'Y' ]]; then
      check_if_apm_package_exists "linter-sass-lint"
   fi

   if [[ $ESLINT_RESPONSE == 'y' || $ESLINT_RESPONSE == 'Y' ]]; then
      check_if_apm_package_exists "linter-eslint"
   fi
else
   fail "Atom’s package manager (APM) is not installed." true
   fail "1. Launch Atom."
   fail "2. Click Atom in the menu bar on the left, next to the Apple icon."
   fail "3. Choose Install Shell Commands."
   fail "4. Close Atom."
   fail "5. Restart this script."

   exit 0
fi
