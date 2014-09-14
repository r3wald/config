#!/bin/sh

echo "Install and setup nodejs"

sudo apt install nodejs npm

npm config set prefix ~/.local/share/npm
echo "PATH=${PATH}:~/.local/share/npm" >> ~/.bashrc

