#!/bin/bash 

# Default path if not provided
server_path=$1
if [[ -z "$server_path" ]]; then
    server_path=$HOME/steam/valheim
fi

export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=$server_path/linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

# Copy the InginTuru.db to valheim_world directory
if [[ ! -e "$HOME/.config/unity3d/IronGate/Valheim/worlds_local/InginTuru.db" ]]; then
    cp ./valheim_world/InginTuru.db $HOME/.config/unity3d/IronGate/Valheim/worlds_local/InginTuru.db
fi

# Copy the InginTuru.fwl to valheim_world directory
if [[ ! -e "$HOME/.config/unity3d/IronGate/Valheim/worlds_local/InginTuru.fwl" ]]; then
    cp ./valheim_world/InginTuru.fwl $HOME/.config/unity3d/IronGate/Valheim/worlds_local/
fi

echo "Starting server PRESS CTRL-C to exit"  
nohup bash $server_path/valheim_server.x86_64 -name "InginTuruNew" -port 2456 -nographics -batchmode -world "InginTuru" -password "HuluSiaBitu" -public 1 >> ./ValheimServer.log &
export LD_LIBRARY_PATH=$templdpath