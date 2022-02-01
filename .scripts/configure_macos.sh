# Disable Sound Effects on Boot
sudo nvram SystemAudioVolume=" "

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Decrease the initial time before a keyboard repeat
defaults write -g InitialKeyRepeat -int 15

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items in pixels
defaults write com.apple.dock tilesize -int 75

# Don't show recent apps in the dock to keep it clean
defaults write com.apple.dock show-recents -bool false

# Set dock app icons
defaults delete com.apple.dock persistent-apps
dock_item() {
  printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>', "$1"
}
defaults write com.apple.dock persistent-apps -array \
  "$(dock_item /Applications/Google\ Chrome.app)" \
  "$(dock_item /Applications/iTerm.app)" \
  "$(dock_item /Applications/Calendar.app)" \
  "$(dock_item /Applications/Evernote.app)" \
  "$(dock_item /Applications/Photos.app)" \
  "$(dock_item /Applications/1Password\ 7.app)" \
  "$(dock_item /Applications/Slack.app)"

# Minimize windows using the scale effect (less intrusive)
defaults write com.apple.dock mineffect -string scale

# Hot corners
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Configure Spotlight search sources
# Yosemite-specific search results (remove them if your are using OS X 10.9 or older) are:
#   MENU_DEFINITION
#   MENU_CONVERSION
#   MENU_EXPRESSION
#   MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#   MENU_WEBSEARCH             (send search queries to Apple)
#   MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
        '{"enabled" = 1;"name" = "APPLICATIONS";}' \
        '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
        '{"enabled" = 1;"name" = "DIRECTORIES";}' \
        '{"enabled" = 0;"name" = "PDF";}' \
        '{"enabled" = 0;"name" = "FONTS";}' \
        '{"enabled" = 1;"name" = "DOCUMENTS";}' \
        '{"enabled" = 0;"name" = "MESSAGES";}' \
        '{"enabled" = 0;"name" = "CONTACT";}' \
        '{"enabled" = 0;"name" = "EVENT_TODO";}' \
        '{"enabled" = 0;"name" = "IMAGES";}' \
        '{"enabled" = 0;"name" = "BOOKMARKS";}' \
        '{"enabled" = 0;"name" = "MUSIC";}' \
        '{"enabled" = 0;"name" = "MOVIES";}' \
        '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
        '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
        '{"enabled" = 0;"name" = "SOURCE";}' \
        '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
        '{"enabled" = 0;"name" = "MENU_OTHER";}' \
        '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
        '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
        '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
        '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable the all too sensitive backswipe in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Disable scrolling to text fragments in Chrome
defaults write com.google.Chrome ScrollToTextFragmentEnabled -bool false

# Expand Save Panel by Default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Do not show crash report dialogs
defaults write com.apple.CrashReporter DialogType none

# Disable "Shake to find" cursor
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool YES

# Show the user library folder
chflags nohidden ~/Library/

# Disable Creation of Metadata Files on USB Volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# App shortcuts
defaults write com.apple.preview NSUserKeyEquivalents \
  '{ "Adjust Size..." = "@~s"; "Hide Sidebar" = "@1"; Thumbnails = "@2"; }'
defaults write com.google.Chrome NSUserKeyEquivalents '{ Extensions = "@~e"; }'
defaults write com.evernote.Evernote NSUserKeyEquivalents '{ "Delete Note" = "@$d"; "Insert Row Below" = "@\U21a9"; }'

# Enable subpixel antialiasing to prevent thin text
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

# Disable screenshots floating thumbnails
defaults write com.apple.screencapture show-thumbnail -bool false

# Disable "App is not optimized for your Mac" alerts
defaults write -g CSUIDisable32BitWarning -boolean true

# Set accent and highlight colors to blue
defaults write -g AppleAccentColor 4
defaults write -g AppleHighlightColor '0.698039 0.843137 1.000000 Blue'

# Set appearance to Auto
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
        "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
        "Terminal" "Transmission" "Twitter" "iCal"; do
        killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
