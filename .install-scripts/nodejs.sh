#!/bin/sh

echo "Setup nodejs (run as root to install packages, run as user to configure)"

if [ $(id -u) = 0 ]; then

	echo "Installing nodejs and npm"
	apt install nodejs npm

else

	echo "Configuring npm"
	echo '> npm config set prefix ~/.local/share/npm'
	npm config set prefix ~/.local/share/npm

	NPMBINPATH='PATH=${PATH}:~/.local/share/npm/bin'
	if ! grep -Fxq $NPMBINPATH ~/.bashrc; then
		echo "Adding \"$NPMBINPATH\" to .bashrc"
		echo $NPMBINPATH >> ~/.bashrc
	fi

fi
