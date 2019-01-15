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

MINIMUM_MAC_OS="10.11.0"
OS_VERSION=$(sw_vers -productVersion)
COMP_NAME=$(scutil --get ComputerName)
LOCL_NAME=$(scutil --get LocalHostName)
HOST_NAME=$(hostname)
USER_NAME=$(id -un)
FULL_NAME=$(finger "$USER_NAME" | awk '/Name:/ {print $4" "$5}')
USER_GRPS=$(id -Gn "$USER_NAME")
OS_NUMBER=$(echo "$OS_VERSION" | cut -d "." -f 2)
MAC_ADDRS=$(ifconfig en0 | grep ether | sed -e 's/^[ \t|ether|\s|\n]*//')
MAC_ADDRS="$(echo -e "${MAC_ADDRS}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

export ATOM_INSTALLER="atom-mac.zip"
export ATOM_CONFIG="config.cson"
BASH_ALIASES=".bash_aliases"
BASH_PROFILE=".bash_profile"
export BASH_RUN_COMMANDS=".bashrc"
export EDITOR_CONFIG_SETTINGS=".editorconfig"
export ESLINT_SETTINGS=".eslintrc.json"
export GITHUB_DESKTOP_INSTALLER="GitHubDesktop.zip"
export GIT_PROMPT=".git-prompt.sh"
export GIT_COMPLETION=".git-completion.sh"
export IBM_PLEX_MONO_INSTALLER="IBM_Plex_Mono.zip"
export IBM_PLEX_MONO_FOLDER="IBM_Plex_Mono"
export SASS_LINT_SETTINGS=".sass-lint.yml"
export SPECTACLE_INSTALLER="Spectacle+1.2.zip"
export SPECTACLE_SHORTCUTS_FILE="Shortcuts.json"
export STYLELINT_SETTINGS=".stylelintrc.json"
export TERMINAL_THEME="TomorrowNight.terminal"
export TYPORA_DISK_IMAGE="Typora.dmg"
export UBUNTU_MONO_INSTALLER="Ubuntu_Mono.zip"
export UBUNTU_MONO_FOLDER="Ubuntu_Mono"
