#####################################################################################
# Install .editorconfig file
#####################################################################################
if [ -e "$HOME/.editorconfig" ]; then
   pause_and_warn ".editorconfig file exists. Renaming to .backup.editorconfig" true
   mv -v "$HOME/.editorconfig" "$HOME/.backup.editorconfig"
fi

inform "Downloading .editorconfig..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/.editorconfig

inform "Installing .editorconfig..."
mv -v .editorconfig "$HOME/"

inform ".editorconfig downloaded and installed to $HOME/.editorconfig"
