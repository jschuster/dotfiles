#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable "Allow wallpaper tinting in windows"
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# All applications use tabs instead of multiple windows
defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"
# Possible values: `manual` = never, `fullscreen`, `always``

# Restore application window on application restart
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true


###############################################################################
# Texthandling                                                                #
###############################################################################

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: Right Click with two fingers tap
defaults write NSGlobalDomain ContextMenuGesture -int 1

# Trackpad: Move window by 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Move window by holding CMD + Control + drag
defaults write NSGlobalDomain NSWindowShouldDragOnGesture -bool true

# Disable back gesture
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Set Dock position to the left
defaults write com.apple.Dock orientation left

# Set Dock position immutable (no accidental change possible)
defaults write com.apple.Dock position-immutable -bool true

# Set icon size immutable (keeps the icon size constant)
defaults write com.apple.Dock size-immutable -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Exposé of opened window on srolling the applications icon in the Dock
defaults write com.apple.dock scroll-to-open -bool true

# Hide date in menu clock
defaults write com.apple.menuextra.clock ShowDate -int 2
# Possible values: `0` = when enough space, `1` = Always and `2` = Never

# Set menu clocks date format
defaults write com.apple.menuextra.clock DateFormat -string "EEE HH:mm"

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false


###############################################################################
# Finder                                                                      #
###############################################################################

# Finder should opt-out of the global set AppleWindowTabbingMode 'always'. See in General UI/UX
defaults write com.apple.finder AppleWindowTabbingMode -string "manual"

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set Desktop as the default location for new Finder windows
# For Home folder, use `PfHm` and `file://${HOME}``
# For Desktop folder, use `PfDe` and `file://${HOME}/Desktop/`
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions (also in e.g. Spotlight search field)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Use list view in all Finder windows by default
# Execute the following line once after you change this setting
#  sudo find / -name ".DS_Store" -exec rm {} \;
# Will delete all individual custom folder settings of ViewStyle 
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Possible values: `icnv` Icon (default), `clmv` Column, `glyv` Gallery, `Nlsv` List

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Possible values: `SCev` search this mac (default), `SCsp` previous scope, `SCcf` current folder

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Safari version 16 and newer uses containered preferences instead of the former com.apple.Safari
# A lot of former Keys still can be set but have no effect even in the new containered preferences

# You may have to add Terminal resp. iTerm2 to the list of `Privacy > Full Disk Access` to be able to execute the following defaults

# Safari should opt-out of the global set AppleWindowTabbingMode 'always'. See in General UI/UX
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AppleWindowTabbingMode -string "manual"

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AutoOpenSafeDownloads -bool false

# Does not work anymore starting Safari 16, even with new keys
# Show Safari’s bookmarks bar by default
# defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFavoritesBar-v2 -bool true

# Enable the Develop menu and the Web Inspector in Safari
#defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari IncludeDevelopMenu -bool true
#defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
#defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Photos" \
	"Safari" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
