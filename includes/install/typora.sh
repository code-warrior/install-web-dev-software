#####################################################################################
# Install Typora
#####################################################################################
if [[ -d "/Applications/Typora.app/" ]]; then
   inform "Typora is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Typora..."
   curl -O "https://typora.io/download/$TYPORA_DISK_IMAGE"

   inform "Installing Typora..."
   open $TYPORA_DISK_IMAGE

   inform "The Finder should have loaded the Typora image. Copy Typora " true
   inform "to the Applications folder. Wait until the copy is finished before "
   inform "proceeding."
   pause_and_warn

   inform "Ejecting Typora disc image..." true
   diskutil eject /Volumes/Typora/

   inform "Removing Typora disc image..." true
   rm -f "$TYPORA_DISK_IMAGE"

   if [[ -e "$TYPORA_DISK_IMAGE" ]]; then
      warn "Removing $TYPORA_DISK_IMAGE was not successful, Please remove manually." true
   else
      inform "Typora’s disc image ejected and removed successfully." true
   fi
fi
