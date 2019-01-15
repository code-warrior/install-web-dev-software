#!/usr/bin/env bash

#####################################################################################
# Install .bash_profile file
#####################################################################################
if [[ -e "$HOME/$BASH_PFILE" ]]; then
   if [[ -e "$HOME/.backup$BASH_PFILE" ]]; then
      inform "$BASH_PFILE and .backup$BASH_PFILE exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$BASH_PFILE file exists." true
      pause_and_warn

      inform "Renaming to .backup$BASH_PFILE..."
      mv -v "$HOME/$BASH_PFILE" "$HOME/.backup$BASH_PFILE"

      inform "Downloading $BASH_PFILE..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PFILE"

      if [[ -e "$BASH_PFILE" ]]; then
         inform "$BASH_PFILE downloaded successfully."

         inform "Installing $BASH_PFILE..."
         mv -v "$BASH_PFILE" "$HOME/"

         if [[ -e "$BASH_PFILE" ]]; then
            warn "$BASH_PFILE was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$BASH_PFILE was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $BASH_PFILE..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_PFILE"

   if [[ -e "$BASH_PFILE" ]]; then
      inform "$BASH_PFILE downloaded successfully."

      inform "Installing $BASH_PFILE..."
      mv -v "$BASH_PFILE" "$HOME/"

      if [[ -e "$BASH_PFILE" ]]; then
         warn "$BASH_PFILE was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$BASH_PFILE was installed successfully."
      fi
   fi
fi
