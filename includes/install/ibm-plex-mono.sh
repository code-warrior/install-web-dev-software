#####################################################################################
# Install the IBM Plex Mono typeface
#####################################################################################
if [ -e "$HOME/Library/Fonts/IBMPlexMono-Regular.ttf" ]; then
   inform "IBM Plex Mono Regular is already installed." true
   pause_and_warn
else
   inform "Downloading the IBM Plex Mono typeface..."
   curl "https://fonts.google.com/download?family=IBM%20Plex%20Mono" -o IBM_Plex_Mono.zip

   inform "Unzipping the IBM Plex Mono typeface..."
   unzip IBM_Plex_Mono.zip -d IBM_Plex_Mono

   inform "Installing the IBM Plex Mono typeface into Font Book..."
   mv IBM_Plex_Mono/*.ttf "$HOME/Library/Fonts/"

   inform "Removing un-needed IBM_Plex_Mono folder..." true
   rm -fr IBM_Plex_Mono

   inform "Removing un-needed IBM_Plex_Mono.zip file..." true
   rm -fr IBM_Plex_Mono.zip
fi
