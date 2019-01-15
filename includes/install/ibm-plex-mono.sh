#!/usr/bin/env bash

#####################################################################################
# Install the IBM Plex Mono typeface
#####################################################################################
if [[ -e "$HOME/Library/Fonts/IBMPlexMono-Regular.ttf" ]]; then
   inform "IBM Plex Mono Regular is already installed." true
   pause_and_warn
else
   inform "Downloading the IBM Plex Mono typeface..."
   curl "https://fonts.google.com/download?family=IBM%20Plex%20Mono" -o "$IBM_PLEX_MONO_INSTALLER"

   inform "Unzipping the IBM Plex Mono typeface..."
   unzip "$IBM_PLEX_MONO_INSTALLER" -d "$IBM_PLEX_MONO_FOLDER"

   inform "Installing the IBM Plex Mono typeface into Font Book..."
   mv "$IBM_PLEX_MONO_FOLDER"/*.ttf "$HOME/Library/Fonts/"

   inform "Removing un-needed IBM_Plex_Mono folder..." true
   rm -fr "$IBM_PLEX_MONO_FOLDER"

   inform "Removing un-needed $IBM_PLEX_MONO_INSTALLER file..." true
   rm -fr "$IBM_PLEX_MONO_INSTALLER"
fi
