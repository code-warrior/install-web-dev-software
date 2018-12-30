#####################################################################################
# Install Tomorrow Night Terminal theme
#####################################################################################
inform "Downloading TomorrowNight.terminal..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/TomorrowNight.terminal

open TomorrowNight.terminal

inform "Bring up The Terminal’s preferences by typing ⌘ + ,. Choose Profiles, " true
inform "which is the second tab on the top, then scroll all the way down along the "
inform "left column until you find TomorrowNight. Click Default, then close the "
inform "Profiles page."
pause_and_warn "Once the theme is installed, come back to this Terminal window."

inform "Removing un-needed TomorrowNight.terminal file..."
rm -f TomorrowNight.terminal
