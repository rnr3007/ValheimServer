#!/bin/sh

# Default path if not provided
server_path=$1
if ! $server_path; then
    server_path=$HOME/steam/valheim
fi

if [[ ! -d $HOME/steam ]]; then
    echo "Creating steam folder in home directory"
    mkdir $HOME/steam
fi

echo -e "\nUpdating Valheim server files..."

steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir $server_path +login anonymous +app_update 896660 -beta public validate +quit

# Install another dependencies for PlayFab
sudo apt update && sudo apt install -y libpulse-dev libatomic1 libc6

# Start server after update
echo -e "\nStarting server..."
./StartValheim.sh $server_path