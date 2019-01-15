#!/usr/bin/env bash

#####################################################################################
# Install .eslintrc.json file
#####################################################################################
if [[ -e "$HOME/$ESLINT_SETTINGS" ]]; then
   if [[ -e "$HOME/.backup$ESLINT_SETTINGS" ]]; then
      inform "$ESLINT_SETTINGS and .backup$ESLINT_SETTINGS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$ESLINT_SETTINGS file exists." true
      pause_and_warn

      inform "Renaming to .backup$ESLINT_SETTINGS..."
      mv -v "$HOME/$ESLINT_SETTINGS" "$HOME/.backup$ESLINT_SETTINGS"

      inform "Downloading $ESLINT_SETTINGS..."
      curl -O https://gist.githubusercontent.com/code-warrior/c6f1b02730b6a7d08c241f5bf1b62258/raw/2cdf414c31785847889697c67a7bd4bbad35393c/"$ESLINT_SETTINGS"

      if [[ -e "$ESLINT_SETTINGS" ]]; then
         inform "$ESLINT_SETTINGS downloaded successfully."

         inform "Installing $ESLINT_SETTINGS..."
         mv -v "$ESLINT_SETTINGS" "$HOME/"

         if [[ -e "$ESLINT_SETTINGS" ]]; then
            warn "$ESLINT_SETTINGS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$ESLINT_SETTINGS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $ESLINT_SETTINGS..."
   curl -O https://gist.githubusercontent.com/code-warrior/c6f1b02730b6a7d08c241f5bf1b62258/raw/2cdf414c31785847889697c67a7bd4bbad35393c/"$ESLINT_SETTINGS"

   if [[ -e "$ESLINT_SETTINGS" ]]; then
      inform "$ESLINT_SETTINGS downloaded successfully."

      inform "Installing $ESLINT_SETTINGS..."
      mv -v "$ESLINT_SETTINGS" "$HOME/"

      if [[ -e "$ESLINT_SETTINGS" ]]; then
         warn "$ESLINT_SETTINGS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$ESLINT_SETTINGS was installed successfully."
      fi
   fi
fi
