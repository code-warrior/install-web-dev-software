#!/usr/bin/env bash

#####################################################################################
# Install Tomorrow Night Terminal theme
#####################################################################################
inform "Downloading $TERMINAL_THEME..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$TERMINAL_THEME"

open "$TERMINAL_THEME"

inform "Bring up The Terminal’s preferences by typing ⌘ + ,. Choose Profiles, " true
inform "which is the second tab on the top, then scroll all the way down along the "
inform "left column until you find TomorrowNight. Click Default, then close the "
inform "Profiles page."

pause_and_warn "Once the theme is installed, come back to this Terminal window." true

inform "Removing un-needed $TERMINAL_THEME file..."
rm -f "$TERMINAL_THEME"
