#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [ -e "$HOME/.bash_aliases" ]; then
   pause_and_warn ".bash_aliases file exists. Renaming to .backup.bash_aliases" true
   mv -v "$HOME/.bash_aliases" "$HOME/.backup.bash_aliases"
fi

inform "Downloading .bash_aliases..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/.bash_aliases

inform "Installing .bash_aliases..."
mv -v .bash_aliases "$HOME/"

inform ".bash_aliases downloaded and installed to $HOME/.bash_aliases"
