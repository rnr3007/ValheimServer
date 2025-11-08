#!/bin/bash 

# Default path if not provided
server_path=$1
if [[ -z "$server_path" ]]; then
    server_path=$HOME/steam/valheim
fi

export templdpath=$LD_LIBRARY_PATH  
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH  
export SteamAppID=892970

echo "Starting server PRESS CTRL-C to exit"  
nohup $server_path/valheim_server.x86_64 -name "InginTuruNew" -port 2456 -nographics -batchmode -world "InginTuru" -password "HuluSiaBitu" -public 1 >> $server_path/ValheimServer.log &
export LD_LIBRARY_PATH=$templdpath