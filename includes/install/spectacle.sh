#!/usr/bin/env bash

#####################################################################################
# Install Spectacle
#####################################################################################
if [[ -d "/Applications/Spectacle.app/" ]]; then
   inform "Spectacle is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Spectacle..."
   curl -O https://s3.amazonaws.com/spectacle/downloads/"$SPECTACLE_INSTALLER"

   inform "Unzipping Spectacle..."
   unzip "$SPECTACLE_INSTALLER"

   inform "Installing Spectacle into Applications..."
   mv -v Spectacle.app /Applications

   if [[ -e "$SPECTACLE_INSTALLER" ]]; then
      inform "Removing $SPECTACLE_INSTALLER..."

      rm -f "$SPECTACLE_INSTALLER"

      if [[ -e "$SPECTACLE_INSTALLER" ]]; then
         warn "Removing $SPECTACLE_INSTALLER was not successful. Please remove manually." true
      else
         inform "Spectacle’s installer removed successfully." true
      fi
   else
      warn "$SPECTACLE_INSTALLER does not exist. Thus, there’s nothing to remove. Continuing..."
   fi

   inform "Launching Spectacle..." true
   open /Applications/Spectacle.app

   warn "If you’re running Spectacle for the first time, do the following:" true
   warn "1. Open System Preferences."
   warn "2. Click Security & Privacy."
   warn "3. Choose Accessibility from the list of applications on the left."
   warn "4. Disable the lock in the lower left corner, if it’s locked."
   warn "5. Check the box to the left of the Spectacle icon."
   warn "6. Enable the lock in the lower left corner."
   warn "7. Quit System Preferences."
   warn "8. Return to this script."
   pause_and_warn

   inform "Downloading custom Spectacle shortcuts ($SPECTACLE_SHORTCUTS_FILE)..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/spectacle/"$SPECTACLE_SHORTCUTS_FILE"

   inform "Installing custom Spectacle shortcuts ($SPECTACLE_SHORTCUTS_FILE)..."
   mv -v "$SPECTACLE_SHORTCUTS_FILE" ~/Library/Application\ Support/Spectacle/

   if [[ -e "$SPECTACLE_SHORTCUTS_FILE" ]]; then
      warn "The Spectacle shortcuts were not successfully installed. Please investigate, then continue."
      pause_and_warn
   else
      inform "The Spectacle shortcuts were installed successfully."
   fi
fi
