#!/usr/bin/env bash

# Reset formatting
export RESET="$(tput sgr0)"

# Foreground color
export BLACK="$(tput setaf 0)"
export WHITE="$(tput setaf 7)"

# Background color
export BG_RED="$(tput setab 1)"
export BG_GREEN="$(tput setab 2)"
export BG_YELLOW="$(tput setab 3)"
export BG_WHITE="$(tput setab 7)"

# Style
export BOLD="$(tput bold)"

export MINIMUM_MAC_OS="10.11.0"
export OS_VERSION="$(sw_vers -productVersion)"
export COMP_NAME="$(scutil --get ComputerName)"
export LOCL_NAME="$(scutil --get LocalHostName)"
export HOST_NAME="$(hostname)"
export USER_NAME="$(id -un)"
export FULL_NAME="$(finger "$USER_NAME" | awk '/Name:/ {print $4" "$5}')"
export USER_GRPS="$(id -Gn "$USER_NAME")"
export OS_NUMBER="$(echo "$OS_VERSION" | cut -d "." -f 2)"
export MAC_ADDRS="$(ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')"
export MAC_ADDRS="$(echo -e "${MAC_ADDRS}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

export ATOM_INSTALLER="atom-mac.zip"
export ATOM_CONFIG="config.cson"
export BASH_ALIAS=".bash_aliases"
export BASH_PFILE=".bash_profile"
export BASH_RUN_COMMANDS=".bashrc"
export EDITOR_CONFIG_SETTINGS=".editorconfig"
export FILEZILLA_INSTALLER="FileZilla_3.40.0_macosx-x86_setup_bundled.dmg"
export GITHUB_DESKTOP_INSTALLER="GitHubDesktop.zip"
export GIT_PROMPT=".git-prompt.sh"
export GIT_COMPLETION=".git-completion.sh"
export IBM_PLEX_MONO_INSTALLER="IBM_Plex_Mono.zip"
export IBM_PLEX_MONO_FOLDER="IBM_Plex_Mono"
export SPECTACLE_INSTALLER="Spectacle+1.2.zip"
export SPECTACLE_SHORTCUTS_FILE="Shortcuts.json"
export STYLELINT_SETTINGS=".stylelintrc.json"
export TERMINAL_THEME="TomorrowNight.terminal"
export TYPORA_DISK_IMAGE="Typora.dmg"
export UBUNTU_MONO_INSTALLER="Ubuntu_Mono.zip"
export UBUNTU_MONO_FOLDER="Ubuntu_Mono"
