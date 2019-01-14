#####################################################################################
# Install .stylelintrc.json file
#####################################################################################
if [[ -e "$HOME/.stylelintrc.json" ]]; then
   pause_and_warn ".stylelintrc.json file exists. Renaming to .backup.stylelintrc.json" true
   mv -v "$HOME/.stylelintrc.json" "$HOME/.backup.stylelintrc.json"
fi

inform "Downloading .stylelintrc.json..."
curl -O https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/.stylelintrc.json

inform "Installing .stylelintrc.json..."
mv -v .stylelintrc.json "$HOME/"

inform ".stylelintrc.json downloaded and installed to $HOME/.stylelintrc.json"
