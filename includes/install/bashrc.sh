#####################################################################################
# Install .bashrc file
#####################################################################################
if [ -e "$HOME/$BASH_RUN_COMMANDS" ]; then
   pause_and_warn "$BASH_RUN_COMMANDS file exists. Renaming to .backup$BASH_RUN_COMMANDS" true
   mv -v "$HOME/$BASH_RUN_COMMANDS" "$HOME/.backup$BASH_RUN_COMMANDS"
fi

inform "Downloading $BASH_RUN_COMMANDS..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/terminal/mac/"$BASH_RUN_COMMANDS"

if [ -e "$BASH_RUN_COMMANDS" ]; then
    inform "$BASH_RUN_COMMANDS downloaded successfully."

    inform "Installing $BASH_RUN_COMMANDS..."
    mv -v "$BASH_RUN_COMMANDS" "$HOME/"

    if [ -e "$BASH_RUN_COMMANDS" ]; then
        warn "Installing $BASH_RUN_COMMANDS was not successful. Please investigate, the continue."
        pause_and_warn
    else
        inform "The $BASH_RUN_COMMANDS was installed successfully."
fi
