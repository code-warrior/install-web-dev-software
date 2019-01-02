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

inform "$BASH_PROFILE downloaded and installed to $HOME/$BASH_PROFILE"
