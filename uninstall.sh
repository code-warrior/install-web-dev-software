#!/usr/bin/env bash

#####################################################################################
# Linted at https://www.shellcheck.net/
#####################################################################################

# Set 256 color profile
export TERM=xterm-256color

source ./includes/globals/variables.sh
source ./includes/globals/functions.sh

#####################################################################################
# Uninstall typefaces
#####################################################################################
source ./includes/uninstall/ibm-plex-mono-font.sh
source ./includes/uninstall/ubuntu-mono.sh

source ./includes/uninstall/editorconfig.sh

#####################################################################################
# Uninstall linters
#####################################################################################
source ./includes/uninstall/stylelintrc.sh

inform "This script is complete. Please restart The Terminal."
