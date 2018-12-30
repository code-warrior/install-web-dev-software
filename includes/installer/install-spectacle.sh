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
