#!/usr/bin/env bash

#####################################################################################
# Install FileZilla
#####################################################################################
if [[ -d "/Applications/FileZilla.app/" ]]; then
   inform "FileZilla is already installed on this machine." true
   pause_and_warn
else
   while true
   do
      warn "Install FileZilla?" true
      read -p "${BG_YELLOW}${BLACK}${BOLD}>>>>  [y]es or [n]o. ${RESET}"  -n 1 -r FILEZILLA_RESPONSE

      case $FILEZILLA_RESPONSE in
         [yY]* )
            inform "Downloading FileZilla..." true
            curl -O "https://download.filezilla-project.org/client/$FILEZILLA_INSTALLER"

            inform "Installing FileZilla..."
            open "$FILEZILLA_INSTALLER"

            inform "The Finder should have loaded the GNU General Public License. " true
            inform "1. Click Agree, then wait for the installer to open."
            inform "2. Double-click the FileZilla.app icon to begin the installation."
            inform "3. At the Introduction screen, click Continue."
            inform "4. At the Optional Offer screen, click Skip."
            inform "5. At the Summary screen, click Finish, then wait for FileZilla to launch."
            inform "6. Quit FileZilla, then return to this script."
            pause_awhile

            inform "Ejecting FileZilla disc image..."
            diskutil eject /Volumes/FileZilla/

            inform "Removing FileZilla disc image..."
            rm -f "$FILEZILLA_INSTALLER"

            if [[ -e "$FILEZILLA_INSTALLER" ]]; then
               warn "Removing $FILEZILLA_INSTALLER was not successful, Please remove manually."
            else
               inform "FileZilla’s disc image ejected and removed successfully."
            fi

            break;;

         [nN]* )
            break;;

         * )
            echo "${BG_YELLOW}${BLACK}${BOLD}>>>>  Please choose. Install FileZilla? [y]es, [n]o, or [q]uit. ${RESET} ";;
      esac
   done
fi
