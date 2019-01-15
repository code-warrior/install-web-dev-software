#####################################################################################
# Install .git-prompt.sh file
#####################################################################################
if [[ -e "$HOME/$GIT_PROMPT" ]]; then
   pause_and_warn "$GIT_PROMPT file exists. Renaming to .backup$GIT_PROMPT" true
   mv -v "$HOME/$GIT_PROMPT" "$HOME/.backup$GIT_PROMPT"
fi

inform "Downloading $GIT_PROMPT..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/git-env-for-mac-and-windows/"$GIT_PROMPT"

if [[ -e "$GIT_PROMPT" ]]; then
   inform "$GIT_PROMPT downloaded successfully."

   inform "Installing $GIT_PROMPT..."
   mv -v "$GIT_PROMPT" "$HOME/"

   if [[ -e "$GIT_PROMPT" ]]; then
      warn "$GIT_PROMPT was not successfully installed. Please investigate, then continue."
      pause_and_warn
   else
      inform "$GIT_PROMPT was installed successfully."
   fi
fi
