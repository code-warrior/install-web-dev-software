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

export MINIMUM_MAJOR_NUMBER_REQUIRED="10"
export MINIMUM_MINOR_NUMBER_REQUIRED="11"
export MINIMUM_PATCH_NUMBER_REQUIRED="0"

export MINIMUM_MAC_OS="10.11.0"
export OS_VERSION="$(sw_vers -productVersion)"
export COMP_NAME="$(scutil --get ComputerName)"
export LOCAL_HOST_NAME="$(scutil --get LocalHostName)"
export HOST_NAME="$(hostname)"
export USER_NAME="$(id -un)"
export FULL_NAME="$(finger "$USER_NAME" | awk '/Name:/ {print $4" "$5}')"
export GROUPS_TO_WHICH_USER_BELONGS="$(id -Gn "$USER_NAME")"
export MAJOR_NUMBER_OF_CURRENT_OS="$(echo "$OS_VERSION" | cut -d "." -f 1)"
export MINOR_NUMBER_OF_CURRENT_OS="$(echo "$OS_VERSION" | cut -d "." -f 2)"
export PATCH_NUMBER_OF_CURRENT_OS="$(echo "$OS_VERSION" | cut -d "." -f 3)"
export MAC_ADDRS="$(ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')"
export MAC_ADDRS="$(echo -e "${MAC_ADDRS}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

export VS_CODE_INSTALLER="VSCode-darwin-universal.zip"
export ATOM_CONFIG="config.cson"
export BASH_ALIAS=".bash_aliases"
export BASH_PFILE=".bash_profile"
export BASH_RUN_COMMANDS=".bashrc"
export EDITOR_CONFIG_SETTINGS=".editorconfig"
export ESLINT_SETTINGS=".eslintrc.json"
export GITHUB_DESKTOP_INSTALLER="GitHubDesktop.zip"
export GIT_PROMPT=".git-prompt.sh"
export GIT_COMPLETION=".git-completion.sh"
export IBM_PLEX_MONO_INSTALLER="IBM_Plex_Mono.zip"
export IBM_PLEX_MONO_FOLDER="IBM_Plex_Mono"
export SASS_LINT_SETTINGS=".sass-lint.yml"
export RECTANGLE_INSTALLER="Rectangle0.64.dmg"
export RECTANGLE_SHORTCUTS_FILE="RectangleConfig.json"
export STYLELINT_SETTINGS=".stylelintrc.json"
export TERMINAL_THEME="TomorrowNight.terminal"
export UBUNTU_MONO_INSTALLER="Ubuntu_Mono.zip"
export UBUNTU_MONO_FOLDER="Ubuntu_Mono"
