#!/usr/bin/env bash

#####################################################################################
# Install FileZilla
#####################################################################################
if [[ -d "/Applications/FileZilla.app/" ]]; then
   inform "FileZilla is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading FileZilla..."
   curl -O "https://download.filezilla-project.org/client/$FILEZILLA_INSTALLER"

   inform "Installing FileZilla..."
   open "$FILEZILLA_INSTALLER"

   inform "The Finder should have loaded the GNU General Public License. " true
   inform "Click “Agree”, then click the FileZilla installer icon."
   inform "Skip all the ads, then, once the installer is successfully installed,"
   inform "close FileZilla and come back to this script."
   pause_and_warn

   inform "Ejecting FileZilla disc image..." true
   diskutil eject /Volumes/FileZilla/

   inform "Removing FileZilla disc image..." true
   rm -f "$FILEZILLA_INSTALLER"

   if [[ -e "$FILEZILLA_INSTALLER" ]]; then
      warn "Removing $FILEZILLA_INSTALLER was not successful, Please remove manually." true
   else
      fail "The FileZilla disc image could not be found, and thus, nothing was ejected. " true
   fi
fi
