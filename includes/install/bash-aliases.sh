#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [ -e "$HOME/$ALIASES" ]; then
   pause_and_warn "$ALIASES file exists. Renaming to .backup$ALIASES" true
   mv -v "$HOME/$ALIASES" "$HOME/.backup$ALIASES"
fi

inform "Downloading $ALIASES..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$ALIASES"

inform "Installing $ALIASES..."
mv -v "$ALIASES" "$HOME/"

# If the file still exists at its current locations, the mv command didn’t work...
if [ -e "$ALIASES" ]; then
   warn "Installing $ALIASES was not successful. Please investigate, then continue."
   pause_and_warn
else
   inform "The $ALIASES file was installed successfully."
fi
