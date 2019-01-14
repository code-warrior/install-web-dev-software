# Reset formatting
RESET=$(tput sgr0)

# Foreground color
BLACK=$(tput setaf 0)
WHITE=$(tput setaf 7)

# Background color
BG_RED=$(tput setab 1)
BG_GREEN=$(tput setab 2)
BG_YELLOW=$(tput setab 3)
BG_WHITE=$(tput setab 7)

# Style
BOLD=$(tput bold)

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

ATOM_INSTALLER="atom-mac.zip"
SPECTACLE_INSTALLER="Spectacle+1.2.zip"
GITHUB_DESKTOP_INSTALLER="GitHubDesktop.zip"
ATOM_CONFIG="config.cson"
TYPORA_DISK_IMAGE="Typora.dmg"
SPECTACLE_SHORTCUTS_FILE="Shortcuts.json"
BASH_ALIASES=".bash_aliases"
BASH_PROFILE=".bash_profile"
BASH_RUN_COMMANDS=".bashrc"
EDITOR_CONFIG_SETTINGS=".editorconfig"
GIT_PROMPT=".git-prompt.sh"
GIT_COMPLETION=".git-completion.sh"
SASS_LINT_SETTINGS=".sass-lint.yml"
