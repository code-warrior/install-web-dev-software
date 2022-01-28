#!/usr/bin/env bash

#####################################################################################
# Install FileZilla
#####################################################################################
if [[ -d "/Applications/FileZilla.app/" ]]; then
   inform "FileZilla is already installed on this machine." true
   pause_and_warn
else
   inform "Downloading FileZilla..."
   curl 'https://dl2.cdn.filezilla-project.org/client/FileZilla_3.57.0_macosx-x86.app.tar.bz2?h=g_335piQ_OqsU14NmA-nzg&x=1643343357' --compressed -o "$FILEZILLA_INSTALLER"

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
