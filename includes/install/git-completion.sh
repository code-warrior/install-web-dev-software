#####################################################################################
# Install .git-completion.sh file
#####################################################################################
if [[ -e "$HOME/$GIT_COMPLETION" ]]; then
   pause_and_warn "$GIT_COMPLETION file exists. Renaming to .backup$GIT_COMPLETION" true
   mv -v "$HOME/$GIT_COMPLETION" "$HOME/.backup$GIT_COMPLETION"
fi

inform "Downloading $GIT_COMPLETION..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_COMPLETION"

if [[ -e "$GIT_COMPLETION" ]]; then
   inform "$GIT_COMPLETION downloaded successfully."

   inform "Installing $GIT_COMPLETION..."
   mv -v "$GIT_COMPLETION" "$HOME/"

   if [[ -e "$GIT_COMPLETION" ]]; then
      warn "$GIT_COMPLETION was not successfully installed. Please investigate, then continue."
      pause_and_warn
   else
      inform "$GIT_COMPLETION was installed successfully."
   fi
fi
