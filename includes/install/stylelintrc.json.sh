#####################################################################################
# Install .stylelintrc.json file
#####################################################################################
if [[ -e "$HOME/$STYLELINT_SETTINGS" ]]; then
   pause_and_warn "$STYLELINT_SETTINGS file exists. Renaming to .backup$STYLELINT_SETTINGS" true
   mv -v "$HOME/$STYLELINT_SETTINGS" "$HOME/.backup$STYLELINT_SETTINGS"
fi

inform "Downloading $STYLELINT_SETTINGS..."
curl -O https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/"$STYLELINT_SETTINGS"

inform "Installing $STYLELINT_SETTINGS..."
mv -v "$STYLELINT_SETTINGS" "$HOME/"

inform "$STYLELINT_SETTINGS downloaded and installed to $HOME/$STYLELINT_SETTINGS"
