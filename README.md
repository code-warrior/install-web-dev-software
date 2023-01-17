# Mac OS Web Development Software Installer

v1.0.5

The enclosed script installs Mac-based HTML-, CSS-, Sass-, and JavaScript-related software and configuration files for any web development course you take with me. If you’re using macOS Catalina, Big Sur, or Monterey, then you’ll first need to grant The Terminal access to your disk. Follow [this tutorial](https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/), then proceed below.

---

## Running This Program

1. **Open The Terminal**: Perform a Spotlight search by typing `⌘` + `spacebar` and entering “terminal”
2. **Navigate to The Root of This Repo**: Type `cd` into The Terminal, followed by a space. *Do not hit `return` just yet.* Drag the folder icon to the left of `install-web-dev-software` in the title bar of this repo into The Terminal window. Hit `return`
3. **Grant the Script Access**: Give the script executable access to your file system by typing the following: `chmod 755 install.sh`
4. **Run The Installer**: Type `./install.sh`

---

## Update bash to v5

Source: [Upgrading Bash on macOS](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba) by Daniel Weibel

1. Launch The Terminal
2. Run `brew install bash`
3. Edit the shells file using Atom: `sudo atom /etc/shells`
4. Add `/usr/local/bin/bash` to the tail of the `shells` file
5. Set the default shell for the current user: `chsh -s /usr/local/bin/bash`
