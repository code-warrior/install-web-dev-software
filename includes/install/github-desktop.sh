#!/usr/bin/env bash

#####################################################################################
# Install GitHub Desktop
#####################################################################################
if [[ -d "/Applications/GitHub Desktop.app/" ]]; then
   inform "GitHub Desktop is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading GitHub Desktop..."
   curl 'https://desktop.githubusercontent.com/github-desktop/releases/2.9.6-9196a1ae/GitHubDesktop-x64.zip' \
  -H 'authority: desktop.githubusercontent.com' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'sec-fetch-site: cross-site' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-user: ?1' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-ch-ua: " Not;A Brand";v="99", "Google Chrome";v="97", "Chromium";v="97"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'referer: https://desktop.github.com/' \
  -H 'accept-language: en-US,en;q=0.9' \
  --compressed -o $GITHUB_DESKTOP_INSTALLER

   inform "Unzipping GitHub Desktop... " true
   inform "Once the installer has been unzipped, move GitHub Desktop into the "
   inform "Applications folder. When the copy is complete, return to this script "
   inform "and continue."
   open "$GITHUB_DESKTOP_INSTALLER"
   pause_and_warn

   inform "Removing "$GITHUB_DESKTOP_INSTALLER"..." true
   rm -f "$GITHUB_DESKTOP_INSTALLER"

   inform "GitHub Desktop’s installer removed." true
fi
