#!/usr/bin/env bash

#####################################################################################
# Install .bash_aliases file
#####################################################################################
if [[ -e "$HOME/$BASH_ALIASES" ]]; then
   if [[ -e "$HOME/.backup$BASH_ALIASES" ]]; then
      inform "$BASH_ALIASES and .backup$BASH_ALIASES exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$BASH_ALIASES file exists." true
      pause_and_warn

      inform "Renaming to .backup$BASH_ALIASES..."
      mv -v "$HOME/$BASH_ALIASES" "$HOME/.backup$BASH_ALIASES"

      inform "Downloading $BASH_ALIASES..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIASES"

      if [[ -e "$BASH_ALIASES" ]]; then
         inform "$BASH_ALIASES downloaded successfully."

         inform "Installing $BASH_ALIASES..."
         mv -v "$BASH_ALIASES" "$HOME/"

         if [[ -e "$BASH_ALIASES" ]]; then
            warn "$BASH_ALIASES was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$BASH_ALIASES was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $BASH_ALIASES..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_ALIASES"

   if [[ -e "$BASH_ALIASES" ]]; then
      inform "$BASH_ALIASES downloaded successfully."

      inform "Installing $BASH_ALIASES..."
      mv -v "$BASH_ALIASES" "$HOME/"

      if [[ -e "$BASH_ALIASES" ]]; then
         warn "$BASH_ALIASES was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$BASH_ALIASES was installed successfully."
      fi
   fi
fi
