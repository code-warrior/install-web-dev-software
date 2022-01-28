#!/usr/bin/env bash

#####################################################################################
# Install FileZilla
#####################################################################################
if [[ -d "/Applications/FileZilla.app/" ]]; then
   inform "FileZilla is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading FileZilla..."
   curl 'https://dl2.cdn.filezilla-project.org/client/'$FILEZILLA_INSTALLER'?h=G1kS7oKn6Dd7N6UlFgf3iQ&x=1643409430' \
     -H 'authority: dl2.cdn.filezilla-project.org' \
     -H 'sec-ch-ua: " Not;A Brand";v="99", "Google Chrome";v="97", "Chromium";v="97"' \
     -H 'sec-ch-ua-mobile: ?0' \
     -H 'sec-ch-ua-platform: "macOS"' \
     -H 'upgrade-insecure-requests: 1' \
     -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36' \
     -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
     -H 'sec-fetch-site: same-site' \
     -H 'sec-fetch-mode: navigate' \
     -H 'sec-fetch-user: ?1' \
     -H 'sec-fetch-dest: document' \
     -H 'referer: https://filezilla-project.org/' \
     -H 'accept-language: en-US,en;q=0.9' \
     --compressed -o $FILEZILLA_INSTALLER

   inform "Unzipping Filezilla... " true
   inform "Once the installer has been unzipped, move FileZilla into the "
   inform "Applications folder. When the copy is complete, return to this script "
   inform "and continue."
   open "$FILEZILLA_INSTALLER"
   pause_and_warn

   inform "Removing "$FILEZILLA_INSTALLER"..." true
   rm -f "$FILEZILLA_INSTALLER"

   inform "FileZilla’s installer removed." true
fi
