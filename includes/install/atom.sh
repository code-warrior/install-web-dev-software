#####################################################################################
# Install Atom
#####################################################################################
if [ -d "/Applications/Atom.app/" ]; then
   inform "Atom is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading Atom..."
   curl 'https://github-production-release-asset-2e65be.s3.amazonaws.com/3228505/70459a00-0399-11e9-96ae-993318bf6878?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20181229%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20181229T052242Z&X-Amz-Expires=300&X-Amz-Signature=2db44d5425ce311b7120dff71b612da87f80a894ecd78216b2e93a3ddf58f83c&X-Amz-SignedHeaders=host&actor_id=1843562&response-content-disposition=attachment%3B%20filename%3Datom-mac.zip&response-content-type=application%2Foctet-stream' -H 'Connection: keep-alive' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'Upgrade-Insecure-Requests: 1' -H 'DNT: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://github.com/atom/atom/releases/tag/v1.33.1' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed -o atom-mac.zip

   inform "Unzipping Atom... " true
   inform "Once the install has been unzipped, move Atom into the Applications "
   inform "folder and launch it. Then, click Atom in the menu bar on the left, "
   inform "right next to the Apple icon, choose Install Shell Commands, and close"
   inform "Atom once you get confirmation. Return to this script and continue."
   open atom-mac.zip
   pause_and_warn

   inform "Removing atom-mac.zip..." true
   rm -f atom-mac.zip

   inform "Atom’s installer removed." true
fi

#####################################################################################
# Install Atom’s config.cson
#####################################################################################
if [ -e "$HOME/.atom/config.cson" ]; then
   inform  "Atom’s config.cson file exists." true
   pause_and_warn

   inform "Renaming config.cson to .atom/backup.config.cson..."
   mv -v "$HOME/.atom/config.cson" "$HOME/.atom/backup.config.cson"
fi

inform "Downloading Atom’s config.cson..."
curl -O https://raw.githubusercontent.com/code-warrior/web-dev-env-config-files/master/atom/config.cson

inform "Installing Atom’s config.cson..."
mv -v config.cson "$HOME/.atom/"

#####################################################################################
# Install Atom packages
#####################################################################################
inform "Installing Atom packages..."
if [ -n "$(apm install)" ]; then
   apm install busy-signal
   apm install intentions
   apm install linter-ui-default
   apm install linter
   apm install editorconfig
   apm install w3c-validation
   apm install linter-stylelint
   apm install emmet
   apm install linter-sass-lint
else
   fail "Atom’s package manager (APM) is not installed. Launch Atom, " true
   fail "click Atom in the menu bar on the left, right next to the Apple icon,"
   fail "then choose Install Shell Commands. "
   fail "Close Atom, then restart this script. Exiting..." true

   exit 0
fi

inform "This script is complete. Please restart The Terminal."
