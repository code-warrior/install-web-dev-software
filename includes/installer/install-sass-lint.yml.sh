#####################################################################################
# Install .sass-lint.yml file
#####################################################################################
if [ -e "$HOME/.sass-lint.yml" ]; then
   pause_and_warn ".sass-lint.yml file exists. Renaming to .backup.sass-lint.yml" true
   mv -v "$HOME/.sass-lint.yml" "$HOME/.backup.sass-lint.yml"
fi

inform "Downloading .sass-lint.yml..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/.sass-lint.yml

inform "Installing .sass-lint.yml..."
mv -v .sass-lint.yml "$HOME/"

inform ".sass-lint.yml downloaded and installed to $HOME/.sass-lint.yml"
