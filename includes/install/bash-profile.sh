#####################################################################################
# Install $BASH_PROFILE file
#####################################################################################
if [ -e "$HOME/$BASH_PROFILE" ]; then
   pause_and_warn "$BASH_PROFILE file exists. Renaming to .backup$BASH_PROFILE" true
   mv -v "$HOME/$BASH_PROFILE" "$HOME/.backup$BASH_PROFILE"
fi

inform "Downloading $BASH_PROFILE..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PROFILE"

inform "Installing $BASH_PROFILE..."
mv -v "$BASH_PROFILE" "$HOME/"

if [ -e "$BASH_PROFILE" ]; then
   warn "Installing $BASH_PROFILE was not successful. Please investigate, then continue."
   pause_and_warn
else
   inform "The $BASH_PROFILE file was installed successfully."
fi
