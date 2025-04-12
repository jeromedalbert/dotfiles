############
### Dock ###
############

defaults write com.apple.dock persistent-apps -array \
  "$(dock_item /Applications/Google\ Chrome.app)" \
  "$(dock_item /Applications/iTerm.app)" \
  "$(dock_item /System/Applications/Calendar.app)" \
  "$(dock_item /System/Applications/Reminders.app)" \
  "$(dock_item /Applications/Evernote.app)" \
  "$(dock_item /System/Applications/Photos.app)" \
  "$(dock_item /Applications/Slack.app)"

########################
### Software Updates ###
########################

sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -int 1
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -int 0
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

##############
### Finder ###
##############

# Configure visibility for default macOS folders
ln -s "$HOME/Desktop" "$HOME/Desktop "
ln -s "$HOME/Documents" "$HOME/Documents "
chflags hidden ~/Pictures
ln -s "$HOME/Documents/Pictures" "$HOME/Pictures "
