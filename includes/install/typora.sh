#!/usr/bin/env bash

#####################################################################################
# Install Typora
#####################################################################################
if [[ -d "/Applications/Typora.app/" ]]; then
   inform "Typora is already installed on this machine." true
   pause_and_warn
else
   while true
   do
      warn "Install Typora?" true
      read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  [y]es or [n]o. ${RESET}"  -n 1 -r TYPORA_RESPONSE

      case $TYPORA_RESPONSE in
         [yY]* )
            inform "Downloading Typora..." true
            curl -O "https://typora.io/download/$TYPORA_DISK_IMAGE"

            inform "Installing Typora..."
            open $TYPORA_DISK_IMAGE

            inform "The Finder should have loaded the Typora image." true
            inform "1. Drag Typora.app over the shortcut to the Applications folder."
            inform "2. Wait until the copy is finished."
            inform "3. Return to this script."
            pause_awhile

            inform "Ejecting Typora disc image..."
            diskutil eject /Volumes/Typora/

            inform "Removing Typora disc image..."
            rm -f "$TYPORA_DISK_IMAGE"

            if [[ -e "$TYPORA_DISK_IMAGE" ]]; then
               warn "Removing $TYPORA_DISK_IMAGE was not successful, Please remove manually."
            else
               inform "Typora’s disc image ejected and removed successfully."
            fi

            break;;

         [nN]* )
            break;;

         * )
            echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Install Typora? [y]es, [n]o, or [q]uit. ${RESET} ";;
      esac
   done
fi
