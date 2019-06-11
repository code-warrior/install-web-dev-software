#!/usr/bin/env bash

#####################################################################################
# Install Tomorrow Night Terminal theme
#####################################################################################
inform "Downloading $TERMINAL_THEME..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$TERMINAL_THEME"

open "$TERMINAL_THEME"

inform "Type ⌘ + , in The Terminal to bring up the preferences page. Choose Profiles, " true
inform "which is the second tab on the top, then scroll all the way down, along the "
inform "left column until you find TomorrowNight. Click Default, then close the "
inform "Profiles page."
inform ""
inform "Once the theme is installed, come back to this Terminal window."
pause_and_warn

inform "Removing un-needed $TERMINAL_THEME file..."
rm -f "$TERMINAL_THEME"
