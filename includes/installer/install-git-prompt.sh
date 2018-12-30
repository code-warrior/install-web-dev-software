#####################################################################################
# Install .git-prompt.sh file
#####################################################################################
if [ -e "$HOME/.git-prompt.sh" ]; then
   pause_and_warn ".git-prompt.sh file exists. Renaming to .backup.git-prompt.sh" true
   mv -v "$HOME/.git-prompt.sh" "$HOME/.backup.git-prompt.sh"
fi

inform "Downloading .git-prompt.sh..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/.git-prompt.sh

inform "Installing .git-prompt.sh..."
mv -v .git-prompt.sh "$HOME/"

inform ".git-prompt.sh downloaded and installed to $HOME/.git-prompt.sh"
