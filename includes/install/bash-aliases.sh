#!/usr/bin/env bash

#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [[ -e "$HOME/$BASH_ALIAS" ]]; then
   if [[ -e "$HOME/.backup$BASH_ALIAS" ]]; then
      inform "$BASH_ALIAS and .backup$BASH_ALIAS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$BASH_ALIAS file exists." true
      pause_and_warn

      inform "Renaming to .backup$BASH_ALIAS..."
      mv -v "$HOME/$BASH_ALIAS" "$HOME/.backup$BASH_ALIAS"

      inform "Downloading $BASH_ALIAS..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIAS"

      if [[ -e "$BASH_ALIAS" ]]; then
         inform "$BASH_ALIAS downloaded successfully."

         inform "Installing $BASH_ALIAS..."
         mv -v "$BASH_ALIAS" "$HOME/"

         if [[ -e "$BASH_ALIAS" ]]; then
            warn "$BASH_ALIAS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$BASH_ALIAS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $BASH_ALIAS..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIAS"

   if [[ -e "$BASH_ALIAS" ]]; then
      inform "$BASH_ALIAS downloaded successfully."

      inform "Installing $BASH_ALIAS..."
      mv -v "$BASH_ALIAS" "$HOME/"

      if [[ -e "$BASH_ALIAS" ]]; then
         warn "$BASH_ALIAS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$BASH_ALIAS was installed successfully."
      fi
   fi
fi
