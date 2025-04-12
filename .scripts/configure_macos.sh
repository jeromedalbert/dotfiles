###############
### General ###
###############

# Set appearance to Auto
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

# Set accent and highlight colors to blue
defaults write -g AppleAccentColor 4
defaults write -g AppleHighlightColor '0.698039 0.843137 1.000000 Blue'

# Require password immediately after sleep or screen saver begins
sysadminctl -screenLock immediate -password -

# Never show notification previews
defaults write com.apple.ncprefs.plist content_visibility -int 1

# Enable subpixel antialiasing to prevent thin text
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

# Disable startup sound
sudo nvram StartupMute=%01

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Expand Save Panel by Default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Do not show crash report dialogs
defaults write com.apple.CrashReporter DialogType none

# Disable "Shake to find" cursor
defaults write ~/Library/Preferences/.GlobalPreferences CGDisableCursorLocationMagnification -bool YES

# Disable Creation of Metadata Files on USB Volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable screenshots floating thumbnails
defaults write com.apple.screencapture show-thumbnail -bool false

# Disable screenshot shadows
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Disable "App is not optimized for your Mac" alerts
defaults write -g CSUIDisable32BitWarning -boolean true

# Disable Airplay Receiver to free up port 5000 used in development
defaults -currentHost write com.apple.controlcenter AirplayRecieverEnabled -int 0

################
### Keyboard ###
################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Decrease the initial time before a keyboard repeat
defaults write -g InitialKeyRepeat -int 15

# When pressing fn/globe by itself, do nothing
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# App shortcuts
defaults write com.apple.preview NSUserKeyEquivalents \
  '{ "Adjust Size..." = "@~s"; "Hide Sidebar" = "@1"; Thumbnails = "@2"; }'
defaults write com.google.Chrome NSUserKeyEquivalents '{ Extensions = "@~e"; }'
defaults write com.monosnap.monosnap NSUserKeyEquivalents '{ "Save" = "@$s"; }'

############
### Dock ###
############

# Automatically hide Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size in pixels
defaults write com.apple.dock tilesize -int 75

# Do not show recent apps
defaults write com.apple.dock show-recents -bool false

# Set app icons
defaults delete com.apple.dock persistent-apps
dock_item() {
  printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>', "$1"
}
defaults write com.apple.dock persistent-apps -array \
  "$(dock_item /Applications/Google\ Chrome.app)" \
  "$(dock_item /Applications/iTerm.app)" \
  "$(dock_item /System/Applications/Calendar.app)" \
  "$(dock_item /System/Applications/Reminders.app)" \
  "$(dock_item /Applications/Evernote.app)" \
  "$(dock_item /Applications/Slack.app)"

# Minimize windows using the scale effect (less intrusive)
defaults write com.apple.dock mineffect -string scale

################
### Menu bar ###
################

# Show battery percentage
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -int 1

# Show bluetooth
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18

# Set clock format
defaults write com.apple.menuextra.clock '{ DateFormat = "EEE H:mm"; ShowDate = 2; ShowDayOfMonth = 0; ShowDayOfWeek = 1; }'

# Hide Siri
defaults write com.apple.Siri StatusMenuVisible -int 0

# Hide Spotlight
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

###############
### Desktop ###
###############

# Set icon size
plutil -replace DesktopViewSettings.IconViewSettings.iconSize -integer 128 ~/Library/Preferences/com.apple.finder.plist

# Top right hot corner: Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom right hot corner: nothing
defaults write com.apple.dock wvous-br-corner -int 1
defaults write com.apple.dock wvous-br-modifier -int 1048576

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

################
### Trackpad ###
################

# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable word lookups with force click
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false

# Set tracking speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -string "0.875"

# Disable force click and haptic feedback
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

########################
### Power management ###
########################

# Do not dim display on battery power
sudo pmset -b lessbright 0

# Turn off display after 7 minutes on battery power
sudo pmset -b displaysleep 7

##############
### Finder ###
##############

# Set Home as the default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable warnings
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Hide recent tags in sidebar
defaults write com.apple.finder ShowRecentTags -bool false

############
### Apps ###
############

# Calendar
defaults write com.apple.iCal.plist "TimeZone support enabled" -int 1
defaults write com.apple.iCal.plist "add holiday calendar" -int 0
defaults write com.apple.iCal.plist "display birthdays calendar" -int 0
defaults write com.apple.suggestions AppCanShowSiriSuggestionsBlacklist -array "com.apple.iCal"

# Spotlight search sources
killall mds >/dev/null 2>&1
defaults write com.apple.spotlight orderedItems -array \
  '{ enabled = 1; name = APPLICATIONS; }' \
  '{ enabled = 1; name = "SYSTEM_PREFS"; }' \
  '{ enabled = 1; name = DIRECTORIES; }' \
  '{ enabled = 1; name = PDF; }' \
  '{ enabled = 0; name = FONTS; }' \
  '{ enabled = 1; name = DOCUMENTS; }' \
  '{ enabled = 0; name = MESSAGES; }' \
  '{ enabled = 0; name = CONTACT; }' \
  '{ enabled = 0; name = "EVENT_TODO"; }' \
  '{ enabled = 1; name = IMAGES; }' \
  '{ enabled = 0; name = BOOKMARKS; }' \
  '{ enabled = 0; name = MUSIC; }' \
  '{ enabled = 0; name = MOVIES; }' \
  '{ enabled = 1; name = PRESENTATIONS; }' \
  '{ enabled = 1; name = SPREADSHEETS; }' \
  '{ enabled = 1; name = SOURCE; }' \
  '{ enabled = 0; name = "MENU_DEFINITION"; }' \
  '{ enabled = 0; name = "MENU_OTHER"; }' \
  '{ enabled = 1; name = "MENU_CONVERSION"; }' \
  '{ enabled = 1; name = "MENU_EXPRESSION"; }' \
  '{ enabled = 0; name = "MENU_SPOTLIGHT_SUGGESTIONS"; }'

# Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome ScrollToTextFragmentEnabled -bool false

#####################
### Refresh macOS ###
#####################

for app in \
  "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" "Dock" \
  "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" "Terminal" \
  "Transmission" "Twitter" "iCal" "ControlStrip"; do
  killall "${app}" >/dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
