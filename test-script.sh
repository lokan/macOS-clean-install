## ************************* CONFIGURATION ********************************
echo "Working on apps settings…"

## FINDER
echo "Finder.app"

# Affichage de la bibliothèque
chflags nohidden ~/Library

# Pas de création de fichiers .DS_STORE
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

## MISSION CONTROL
# Pas d'organisation des bureaux en fonction des apps ouvertes
defaults write com.apple.dock mru-spaces -bool false
