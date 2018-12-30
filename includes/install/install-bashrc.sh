#####################################################################################
# Install .bashrc file
#####################################################################################
if [ -e "$HOME/.bashrc" ]; then
   pause_and_warn ".bashrc file exists. Renaming to .backup.bashrc" true
   mv -v "$HOME/.bashrc" "$HOME/.backup.bashrc"
fi

inform "Downloading .bashrc..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bashrc

inform "Installing .bashrc..."
mv -v .bashrc "$HOME/"

inform ".bashrc downloaded and installed to $HOME/.bashrc"
