#!/bin/sh

## README
# /!\ This script is designed to meet my needs. Don't use it before checking every command ! /!\

## Homebrew
if test ! $(which brew)
then
	echo 'Installing Homebrew'
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for updates
brew update

## Utilities : Cask and MAS (Mac App Store)
echo 'Installing MAS (Mac App Store).'
brew install mas
echo "ID iCloud :"
read COMPTE
echo "Password : $COMPTE"
read -s PASSWORD
mas signin $COMPTE "$PASSWORD"

echo 'Homebrew Cask'
brew tap caskroom/cask

# Installation d'apps avec MAS (source : https://github.com/argon/mas/issues/41#issuecomment-245846651)
function install () {
	# Check if the App is already installed
	mas list | grep -i "$1" > /dev/null

	if [ "$?" == 0 ]; then
		echo "==> $1 is already installed"
	else
		echo "==> Installing $1..."
		mas search "$1" | { read app_ident app_name ; mas install $app_ident ; }
	fi
}

## Softwares installation

echo 'Internet'
install "Reeder 4"
install "1Password"
brew cask install 1password firefox transmission

echo 'Monitoring'
brew cask install istat-menus

echo 'iWork'
install "Pages"
install "Keynote"
install "Numbers"

echo 'Developpement'
brew cask install github-desktop atom coda transmit

echo 'Utilities'
brew cask install carbon-copy-cloner handbrake

echo 'Communication'
install "Grids for Instagram"

echo 'Apps images.'
install "Pixelmator"
install "Final Cut Pro"
install "Compressor"

## Cleaning

echo "Derniers nettoyages…"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

echo "ET VOILÀ !"
echo "Please run app-congig.sh script"
