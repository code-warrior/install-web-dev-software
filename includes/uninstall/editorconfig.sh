#####################################################################################
# Restoring .editorconfig file.
#####################################################################################
if [ -e "$HOME/.editorconfig" ]; then
   pause_and_warn ".editorconfig file exists. Removing .editorconfig" true
   rm -f "$HOME/.editorconfig"
fi

if [ -e "$HOME/.backup.editorconfig" ]; then
   pause_and_warn ".backup.editorconfig file exists. Renaming to .editorconfig" true
   mv -v "$HOME/.backup.editorconfig" "$HOME/.editorconfig"
fi
