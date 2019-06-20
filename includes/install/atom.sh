#!/usr/bin/env bash

#####################################################################################
# Install Atom
#####################################################################################
if [[ -d "/Applications/Atom.app/" ]]; then
   inform "Atom is already installed on this machine." true
   pause_and_warn
else
fi
