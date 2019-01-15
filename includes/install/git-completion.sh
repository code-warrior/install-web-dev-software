#####################################################################################
# Install .git-completion.sh file
#####################################################################################
if [[ -e "$HOME/$GIT_COMPLETION" ]]; then
   if [[ -e "$HOME/.backup$GIT_COMPLETION" ]]; then
      inform "$GIT_COMPLETION and .backup$GIT_COMPLETION exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$GIT_COMPLETION file exists." true
      pause_and_warn

      inform "Renaming to .backup$GIT_COMPLETION..."
      mv -v "$HOME/$GIT_COMPLETION" "$HOME/.backup$GIT_COMPLETION"

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
   fi
else
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
fi
