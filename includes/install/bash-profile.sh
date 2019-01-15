#!/usr/bin/env bash

#####################################################################################
# Install .bash_profile file
#####################################################################################
if [[ -e "$HOME/$BASH_PFILE" ]]; then
   pause_and_warn "$BASH_PFILE file exists. Renaming to .backup$BASH_PFILE" true
   mv -v "$HOME/$BASH_PFILE" "$HOME/.backup$BASH_PFILE"
fi

inform "Downloading $BASH_PFILE..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PFILE"

inform "Installing $BASH_PFILE..."
mv -v "$BASH_PFILE" "$HOME/"

if [[ -e "$BASH_PFILE" ]]; then
   warn "$BASH_PFILE was not successfully installed. Please investigate, then continue."
   pause_and_warn
else
   inform "$BASH_PFILE was installed successfully."
fi
