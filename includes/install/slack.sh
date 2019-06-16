#!/usr/bin/env bash

#####################################################################################
# Install Slack
#####################################################################################
if [[ -d "/Applications/Slack.app/" ]]; then
   inform "Slack is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Slack..."
   curl 'https://downloads.slack-edge.com/mac_releases/Slack-3.4.2.dmg' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -o Slack-3.4.2.dmg

   inform "Installing Slack..."
   open "$SLACK_INSTALLER"

   inform "The Finder should have mounted $SLACK_INSTALLER. " true
   inform "1. Drag Slack.app over the shortcut to the Applications folder."
   inform "2. Wait until the copy is finished."
   inform "3. Return to this script."
   pause_and_warn

   inform "Ejecting Slack’s disc image..." true
   diskutil eject /Volumes/Slack/

   inform "Removing Slack’s disc image..." true
   rm -f "$SLACK_INSTALLER"

   if [[ -e "$SLACK_INSTALLER" ]]; then
      warn "Removing $SLACK_INSTALLER was not successful, Please remove manually." true
   else
      inform "Slack’s disc image ejected and removed successfully." true
      inform
   fi
fi
