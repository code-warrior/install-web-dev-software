#####################################################################################
# Install .git-completion.sh file
#####################################################################################
if [ -e "$HOME/.git-completion.sh" ]; then
   pause_and_warn ".git-completion.sh file exists. Renaming to .backup.git-completion.sh" true
   mv -v "$HOME/.git-completion.sh" "$HOME/.backup.git-completion.sh"
fi

inform "Downloading .git-completion.sh..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/.git-completion.sh

inform "Installing .git-completion.sh..."
mv -v .git-completion.sh "$HOME/"

inform ".git-completion.sh downloaded and installed to $HOME/.git-completion.sh"
