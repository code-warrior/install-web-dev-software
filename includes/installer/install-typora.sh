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
