#!/bin/bash
# This command will start the server in background and log output to valheim_server.log
nohup ./ServerWakeup.sh >> valheim_server.log 2>&1 &
