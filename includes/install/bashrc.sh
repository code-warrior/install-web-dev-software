#!/usr/bin/env bash

#####################################################################################
# Install .bashrc file
#####################################################################################
if [[ -e "$HOME/$BASH_RUN_COMMANDS" ]]; then
   if [[ -e "$HOME/.backup$BASH_RUN_COMMANDS" ]]; then
      inform "$BASH_RUN_COMMANDS and .backup$BASH_RUN_COMMANDS exist." true
      inform "Nothing to install. Continuing..."
   else
      inform "$BASH_RUN_COMMANDS file exists." true
      pause_and_warn

      inform "Renaming to .backup$BASH_RUN_COMMANDS..."
      mv -v "$HOME/$BASH_RUN_COMMANDS" "$HOME/.backup$BASH_RUN_COMMANDS"

      inform "Downloading $BASH_RUN_COMMANDS..."
      curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_RUN_COMMANDS"

      if [[ -e "$BASH_RUN_COMMANDS" ]]; then
         inform "$BASH_RUN_COMMANDS downloaded successfully."

         inform "Installing $BASH_RUN_COMMANDS..."
         mv -v "$BASH_RUN_COMMANDS" "$HOME/"

         if [[ -e "$BASH_RUN_COMMANDS" ]]; then
            warn "$BASH_RUN_COMMANDS was not successfully installed. Please investigate, then continue."
            pause_and_warn
         else
            inform "$BASH_RUN_COMMANDS was installed successfully."
         fi
      fi
   fi
else
   inform "Downloading $BASH_RUN_COMMANDS..."
   curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_RUN_COMMANDS"

   if [[ -e "$BASH_RUN_COMMANDS" ]]; then
      inform "$BASH_RUN_COMMANDS downloaded successfully."

      inform "Installing $BASH_RUN_COMMANDS..."
      mv -v "$BASH_RUN_COMMANDS" "$HOME/"

      if [[ -e "$BASH_RUN_COMMANDS" ]]; then
         warn "$BASH_RUN_COMMANDS was not successfully installed. Please investigate, then continue."
         pause_and_warn
      else
         inform "$BASH_RUN_COMMANDS was installed successfully."
      fi
   fi
fi
