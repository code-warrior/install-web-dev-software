#####################################################################################
# Restoring .stylelintrc.json file.
#####################################################################################
if [ -e "$HOME/.stylelintrc.json" ]; then
   pause_and_warn ".stylelintrc.json file exists. Removing .stylelintrc.json" true
   rm -f "$HOME/.stylelintrc.json"
fi

if [ -e "$HOME/.backup.stylelintrc.json" ]; then
   pause_and_warn ".backup.stylelintrc.json file exists. Renaming to .stylelintrc.json" true
   mv -v "$HOME/.backup.stylelintrc.json" "$HOME/.stylelintrc.json"
fi
