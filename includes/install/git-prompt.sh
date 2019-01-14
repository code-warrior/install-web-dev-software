#####################################################################################
# Install .git-prompt.sh file
#####################################################################################
if [[ -e "$HOME/$GIT_PROMPT" ]]; then
   pause_and_warn "$GIT_PROMPT file exists. Renaming to .backup$GIT_PROMPT" true
   mv -v "$HOME/$GIT_PROMPT" "$HOME/.backup$GIT_PROMPT"
fi

inform "Downloading $GIT_PROMPT..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and
-windows/"$GIT_PROMPT"

inform "Installing $GIT_PROMPT..."
mv -v "$GIT_PROMPT" "$HOME/"

inform "$GIT_PROMPT downloaded and installed to $HOME/$GIT_PROMPT"
