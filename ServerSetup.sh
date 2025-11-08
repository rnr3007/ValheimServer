#!/bin/bash
# Create steam user login if you want
read -p "$(echo -e 'Do you want to create steam user?\n(Press any key for yes, and N for no)')" is_create_steam_user
if [[ $is_create_steam_user -ne "N" ]]; then
    if id steam &>/dev/null; then
        echo "User 'steam' already exists."
    else
        sudo useradd -m steam
        sudo passwd steam
    fi
    sudo su -l steam
fi

# Install steamCMD
echo "Checking for steamcmd installation..."
hash steamcmd &>/dev/null
if [[ $? -ne 0 ]]; then
    echo "steamcmd not found, installing..."
    sudo add-apt-repository multiverse; sudo dpkg --add-architecture i386; sudo apt update
    sudo apt install -y steamcmd
else
    echo "steamcmd found, skipping installation."
fi

# Default path if not provided
server_path=$1
if [[ ! $server_path || $server_path -eq "" ]]; then
    server_path=$HOME/steam/valheim
fi

./InstallUpdate.sh $server_path