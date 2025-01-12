## Mac Settings
### Dock
Ice
---------------------------
Ice is a powerful menu bar management tool. While its primary function is hiding and showing menu bar items, it aims to cover a wide variety of additional features to make it one of the most versatile menu bar tools available.
install via brew cask: `brew install jordanbaird-ice`

### Trackpad
    * Make the trackpad faster
    * Point & Click
    * Enable Tap to click with one finger
    * Change Secondary click to Right corner
### Dock
    * Hide the dock
    * Get rid of everything in the Dock except for the trashcan, finder and settings
### Defaults
Change the default location for saving screenshots
Open the terminal and create a new folder where you want to save your screenshots: mkdir -p /path/to/screenshots/
Then run the following command to set the location and reload the SystemUIServer: defaults write com.apple.screencapture location /path/to/screenshots/ && killall SystemUIServer

Displays: Switch to Apple Display (p3-600) for slightly better battery life


## Mac Tools
[Raycast](https://raycast.com/) 
---------------------------
is a replacment for Alfred. 

## Research
[Zotero](https://www.zotero.org/)
---------------------------

Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research.  Zotero has a nice PDF reader and markup tools, and also has an iPad app that syncs seamlessly. 
Insporation from [EY](https://eugeneyan.com/writing/mac-setup/)
Install via brew cask: `brew install --cask zotero`

## Entertainment
Spotify
---------------------------
Install via brew cask: `brew install --cask spotify`

VLC
---------------------------
Install via brew cask: `brew install --cask vlc`

## Search
The Silver Searcher
---------------------------
Install via brew cask: `brew install the_silver_searcher`
The Silver Searcher is a code-searching tool similar to ack, but faster.


Tree
---------------------------
Install via brew cask: `brew install tree`
Tree is a recursive directory listing program that produces a depth indented listing of files, which is colorized ala dircolors if the LS_COLORS environment variable is set and output is to tty.

## Dev Tools
Entr
---------------------------
Install via brew cask: `brew install entr`
Entr provides a runtime mini-filesystem based on the entries in the Name Service Switch (NSS) and augments it with support for the FSEvents API on OS X and inotify on Linux. This allows it to detect changes to local files and directories in real time.

Example usage:
`ls | entr make`

## Dev Environment
Neovim
---------------------------
Install via brew cask: `brew install neovim`

Starship
---------------------------
Install via brew cask: `brew install starship`
Starship is a minimal, fast, and highly configurable prompt for any shell!


