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

inform "$ALIASES downloaded and installed to $HOME/$ALIASES"
