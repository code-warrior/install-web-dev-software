#!/usr/bin/env bash

#####################################################################################
# Install Spectacle
#####################################################################################
if [[ -d "/Applications/Spectacle.app/" ]]; then
   inform "Spectacle is already installed on this machine." true
   pause_and_warn
else
   while true
   do
      warn "Install Spectacle?" true
      read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  [y]es or [n]o. ${RESET}"  -n 1 -r SPECTACLE_RESPONSE

      case $SPECTACLE_RESPONSE in
         [yY]* )
            inform "Downloading Spectacle..." true
            curl -O https://s3.amazonaws.com/spectacle/downloads/"$SPECTACLE_INSTALLER"

            inform "Unzipping Spectacle..."
            unzip "$SPECTACLE_INSTALLER"

            inform "Installing Spectacle into Applications..."
            mv -v Spectacle.app /Applications

            if [[ -e "$SPECTACLE_INSTALLER" ]]; then
               inform "Removing $SPECTACLE_INSTALLER..."

               rm -f "$SPECTACLE_INSTALLER"

               if [[ -e "$SPECTACLE_INSTALLER" ]]; then
                  warn "Removing $SPECTACLE_INSTALLER was not successful. Please remove manually."
               else
                  inform "Spectacle’s installer removed successfully."
               fi
            else
               warn "$SPECTACLE_INSTALLER does not exist. Thus, there’s nothing to remove. Continuing..."
            fi

            inform "Launching Spectacle..."
            open /Applications/Spectacle.app

            inform "If you’re running Spectacle for the first time, do the following:" true
            inform "1. Open System Preferences."
            inform "2. Click Security & Privacy."
            inform "3. Choose Accessibility from the list of applications on the left."
            inform "4. Disable the lock in the lower left corner, if it’s locked."
            inform "5. Check the box to the left of the Spectacle icon."
            inform "6. Enable the lock in the lower left corner."
            inform "7. Quit System Preferences."
            inform "8. Return to this script."
            pause_awhile

            inform "Downloading custom Spectacle shortcuts ($SPECTACLE_SHORTCUTS_FILE)..."
            curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/spectacle/"$SPECTACLE_SHORTCUTS_FILE"

            inform "Installing custom Spectacle shortcuts ($SPECTACLE_SHORTCUTS_FILE)..."
            mv -v "$SPECTACLE_SHORTCUTS_FILE" ~/Library/Application\ Support/Spectacle/

            if [[ -e "$SPECTACLE_SHORTCUTS_FILE" ]]; then
               warn "The Spectacle shortcuts were not successfully installed. Please investigate, then continue."
            else
               inform "The Spectacle shortcuts were installed successfully."
            fi

            break;;

         [nN]* )
            break;;

         * )
            echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Need Spectacle? [y]es, [n]o, or [q]uit. ${RESET} ";;
      esac
   done
fi
