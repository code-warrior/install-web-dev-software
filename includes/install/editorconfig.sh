#####################################################################################
# Install .editorconfig file
#####################################################################################
if [ -e "$HOME/$EDITOR_CONFIG_SETTINGS" ]; then
   pause_and_warn "$EDITOR_CONFIG_SETTINGS file exists. Renaming to .backup$EDITOR_CONFIG_SETTINGS" true
   mv -v "$HOME/$EDITOR_CONFIG_SETTINGS" "$HOME/.backup$EDITOR_CONFIG_SETTINGS"
fi

inform "Downloading $EDITOR_CONFIG_SETTINGS..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/"$EDITOR_CONFIG_SETTINGS"

inform "Installing $EDITOR_CONFIG_SETTINGS..."
mv -v "$EDITOR_CONFIG_SETTINGS" "$HOME/"

inform "$EDITOR_CONFIG_SETTINGS downloaded and installed to $HOME/$EDITOR_CONFIG_SETTINGS"
