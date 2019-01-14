#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [[ -e "$HOME/$BASH_ALIASES" ]]; then
   pause_and_warn "$BASH_ALIASES file exists. Renaming to .backup$BASH_ALIASES" true
   mv -v "$HOME/$BASH_ALIASES" "$HOME/.backup$BASH_ALIASES"
fi

inform "Downloading $BASH_ALIASES..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIASES"

inform "Installing $BASH_ALIASES..."
mv -v "$BASH_ALIASES" "$HOME/"

# If the file still exists at its current locations, the mv command didn’t work...
if [[ -e "$BASH_ALIASES" ]]; then
   warn "Installing $BASH_ALIASES was not successful. Please investigate, then continue."
   pause_and_warn
else
   inform "The $BASH_ALIASES file was installed successfully."
fi
