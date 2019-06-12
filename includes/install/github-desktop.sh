#!/usr/bin/env bash

#####################################################################################
# Install GitHub Desktop
#####################################################################################
if [[ -d "/Applications/GitHub Desktop.app/" ]]; then
   inform "GitHub Desktop is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading GitHub Desktop..."
   curl 'https://desktop.githubusercontent.com/releases/2.0.3-d79a43a1/GitHubDesktop.zip' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Referer: https://desktop.githubusercontent.com/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o GitHubDesktop.zip

   inform "Unzipping GitHub Desktop... " true
   open "$GITHUB_DESKTOP_INSTALLER"

   inform "1. Open the Applications folder in your computer’s root directory (/Applications) not the Applications folder in your home directory (~/Applications)."
   inform "2. Move GitHub Desktop.app into the Applications folder."
   inform "3. Wait until the copy is complete."
   inform "4. Return to this script."
   pause_and_warn

   inform "Removing "$GITHUB_DESKTOP_INSTALLER"..." true
   rm -f "$GITHUB_DESKTOP_INSTALLER"

   inform "GitHub Desktop’s installer removed." true
fi
