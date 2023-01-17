#!/usr/bin/env bash

#####################################################################################
# Install VS Code
#####################################################################################
if [[ -d "/Applications/Visual Studio Code.app" ]]; then
   inform "VS Code is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading VS Code..."

  curl 'https://az764295.vo.msecnd.net/stable/97dec172d3256f8ca4bfb2143f3f76b503ca0534/VSCode-darwin-universal.zip' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:108.0) Gecko/20100101 Firefox/108.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'Referer: https://code.visualstudio.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -H 'Sec-GPC: 1' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: trailers' --compressed -o "$VS_CODE_INSTALLER"

   inform "Unzipping VS Code... " true
   inform "Once the installer has been unzipped, move VS Code into the "
   inform "Applications folder, then return to this script and continue."
   open "$VS_CODE_INSTALLER"
   pause_and_warn

   if [[ -e "$VS_CODE_INSTALLER" ]]; then
      inform "Removing $VS_CODE_INSTALLER..." true

      rm -f "$VS_CODE_INSTALLER"

      if [[ -e "$VS_CODE_INSTALLER" ]]; then
         warn "Removing $VS_CODE_INSTALLER was not successful. Please remove manually." true
      else
         inform "VS Code’s installer has been removed successfully." true
      fi
   else
      warn "$VS_CODE_INSTALLER does not exist. Thus, there’s nothing to remove. Continuing..."
   fi
fi
