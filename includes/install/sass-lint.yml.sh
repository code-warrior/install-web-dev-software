#####################################################################################
# Install .sass-lint.yml file
#####################################################################################
if [[ -e "$HOME/$SASS_LINT_SETTINGS" ]]; then
   pause_and_warn "$SASS_LINT_SETTINGS file exists. Renaming to .backup$SASS_LINT_SETTINGS" true
   mv -v "$HOME/$SASS_LINT_SETTINGS" "$HOME/.backup$SASS_LINT_SETTINGS"
fi

inform "Downloading $SASS_LINT_SETTINGS..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/"$SASS_LINT_SETTINGS"

inform "Installing $SASS_LINT_SETTINGS..."
mv -v "$SASS_LINT_SETTINGS" "$HOME/"

inform "$SASS_LINT_SETTINGS downloaded and installed to $HOME/$SASS_LINT_SETTINGS"
