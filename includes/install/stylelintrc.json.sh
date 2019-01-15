#####################################################################################
# Install .stylelintrc.json file
#####################################################################################
if [[ -e "$HOME/$STYLELINT_SETTINGS" ]]; then
   if [[ -e "$HOME/.backup$STYLELINT_SETTINGS" ]]; then
      inform "$STYLELINT_SETTINGS and .backup$STYLELINT_SETTINGS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$STYLELINT_SETTINGS file exists." true
      pause_and_warn

      inform "Renaming to .backup$STYLELINT_SETTINGS..."
      mv -v "$HOME/$STYLELINT_SETTINGS" "$HOME/.backup$STYLELINT_SETTINGS"

      inform "Downloading $STYLELINT_SETTINGS..."
      curl -O https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/"$STYLELINT_SETTINGS"

      if [[ -e "$STYLELINT_SETTINGS" ]]; then
         inform "$STYLELINT_SETTINGS downloaded successfully."

         inform "Installing $STYLELINT_SETTINGS..."
         mv -v "$STYLELINT_SETTINGS" "$HOME/"

         if [[ -e "$STYLELINT_SETTINGS" ]]; then
            warn "$STYLELINT_SETTINGS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$STYLELINT_SETTINGS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $STYLELINT_SETTINGS..."
   curl -O https://gist.githubusercontent.com/code-warrior/a766f7c32bab9a82b467601800b00a46/raw/768717143df9db9c593dabb38c3c7aa63c87f66b/"$STYLELINT_SETTINGS"

   if [[ -e "$STYLELINT_SETTINGS" ]]; then
      inform "$STYLELINT_SETTINGS downloaded successfully."

      inform "Installing $STYLELINT_SETTINGS..."
      mv -v "$STYLELINT_SETTINGS" "$HOME/"

      if [[ -e "$STYLELINT_SETTINGS" ]]; then
         warn "$STYLELINT_SETTINGS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$STYLELINT_SETTINGS was installed successfully."
      fi
   fi
fi
