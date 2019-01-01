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

   inform "Ejecting Typora disc image..." true
   diskutil eject /Volumes/Typora/

   rm -f Typora.dmg
   inform "Removing Typora disc image..." true

   inform "Typora’s install image ejected and its install removed." true
fi
