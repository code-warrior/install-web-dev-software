Make a list of files to remove, then create a basic script to remove them. This will make the installer script easier to test.

1. If no file is found, install it.
2. If a file is found, add an option that asks whether the user would like to skip installing the file again.

## Remove the typefaces
`rm ~/Library/Fonts/IBMPlexMono*.ttf`
`rm ~/Library/Fonts/UbuntuMono*.ttf`

## Remove programs
rm -f /Applications/Spectacle.app
rm -f /Applications/Typora.app
rm -f /Applications/GitHub\ Desktop.app/
rm -f /Applications/Atom.app/

## Remove conditionally
1. Check for a .backup version. If one exists, rename the file, sans .backup.
2. If a backup does not exist, then remove it.

rm -f ~/.stylelintrc.json
rm -f ~/.git-prompt.sh
rm -f ~/.git-completion.sh
rm -f ~/.bash_aliases
rm -f ~/.bashrc
rm -f ~/.bash_profile
rm -f ~/.editorconfig
rm -f ~/.atom/

## Remove
rm -f ~/Library/Application\ Support/Spectacle/Shortcuts.json
