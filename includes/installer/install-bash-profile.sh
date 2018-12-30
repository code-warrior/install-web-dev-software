#####################################################################################
# Install .bash_profile file
#####################################################################################
if [ -e "$HOME/.bash_profile" ]; then
   pause_and_warn ".bash_profile file exists. Renaming to .backup.bash_profile" true
   mv -v "$HOME/.bash_profile" "$HOME/.backup.bash_profile"
fi

inform "Downloading .bash_profile..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bash_profile

inform "Installing .bash_profile..."
mv -v .bash_profile "$HOME/"

inform ".bash_profile downloaded and installed to $HOME/.bash_profile"
