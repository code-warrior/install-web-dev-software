#####################################################################################
# Install GitHub Desktop
#####################################################################################
if [[ -d "/Applications/GitHub Desktop.app/" ]]; then
   inform "GitHub Desktop is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading GitHub Desktop..."
   curl 'https://desktop.githubusercontent.com/releases/1.5.1-b1e34b0f/$GITHUB_DESKTOP_INSTALLER' -H 'Connection:
   keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://desktop.github.com/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o "$GITHUB_DESKTOP_INSTALLER"

   inform "Unzipping GitHub Desktop... " true
   inform "Once the install has been unzipped, move GitHub Desktop into the "
   inform "Applications folder, then, once it’s copied, return to this script "
   inform "and continue."
   open "$GITHUB_DESKTOP_INSTALLER"
   pause_and_warn

   inform "Removing "$GITHUB_DESKTOP_INSTALLER"..." true
   rm -f "$GITHUB_DESKTOP_INSTALLER"

   inform "GitHub Desktop’s installer removed." true
fi
