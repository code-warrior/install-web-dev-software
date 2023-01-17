#!/usr/bin/env bash

#####################################################################################
# Install Rectangle
#####################################################################################
if [[ -d "/Applications/Rectangle.app/" ]]; then
   inform "Rectangle is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Rectangle..."
   curl -JLO https://github.com/rxhanson/Rectangle/releases/download/v0.64/"$RECTANGLE_INSTALLER"

   inform "Opening Rectangle..."
   open "$RECTANGLE_INSTALLER"

   inform "Installing Rectangle into Applications..."
   cp /Volumes/Rectangle0.64/Rectangle.app/ /Applications

   inform "Launching Rectangle..." true
   open /Applications/Rectangle.app

   inform "Downloading custom Rectangle shortcuts ($RECTANGLE_SHORTCUTS_FILE)..."
   curl -JLO https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/rectangle/RectangleConfig.json

   warn "1. Place focus on Rectangle, which was just launched" true
   warn "2. Go to Preferences..."
   warn "3. Click the cogwheel in the upper right hand corner"
   warn "4. Click Import on the bottom"
   warn "5. Choose the RectangleConfig.json file that was just downloaded."
   pause_and_warn
fi
