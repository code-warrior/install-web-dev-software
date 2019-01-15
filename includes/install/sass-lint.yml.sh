#####################################################################################
# Install .sass-lint.yml file
#####################################################################################
if [[ -e "$HOME/$SASS_LINT_SETTINGS" ]]; then
   if [[ -e "$HOME/.backup$SASS_LINT_SETTINGS" ]]; then
      inform "$SASS_LINT_SETTINGS and .backup$SASS_LINT_SETTINGS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$SASS_LINT_SETTINGS file exists." true
      pause_and_warn

      inform "Renaming to .backup$SASS_LINT_SETTINGS" true
      mv -v "$HOME/$SASS_LINT_SETTINGS" "$HOME/.backup$SASS_LINT_SETTINGS"

      inform "Downloading $SASS_LINT_SETTINGS..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/"$SASS_LINT_SETTINGS"

      if [[ -e "$SASS_LINT_SETTINGS" ]]; then
         inform "$SASS_LINT_SETTINGS downloaded successfully."

         inform "Installing $SASS_LINT_SETTINGS..."
         mv -v "$SASS_LINT_SETTINGS" "$HOME/"

         if [[ -e "$SASS_LINT_SETTINGS" ]]; then
            warn "$SASS_LINT_SETTINGS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$SASS_LINT_SETTINGS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $SASS_LINT_SETTINGS..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/sass/"$SASS_LINT_SETTINGS"

   if [[ -e "$SASS_LINT_SETTINGS" ]]; then
      inform "$SASS_LINT_SETTINGS downloaded successfully."

      inform "Installing $SASS_LINT_SETTINGS..."
      mv -v "$SASS_LINT_SETTINGS" "$HOME/"

      if [[ -e "$SASS_LINT_SETTINGS" ]]; then
         warn "$SASS_LINT_SETTINGS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$SASS_LINT_SETTINGS was installed successfully."
      fi
   fi
fi
