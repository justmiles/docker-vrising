#!/bin/bash

SERVER_DIR="${SERVER_DIR:-/server}"
DATA_DIR="${DATA_DIR:-/data}"

cd "$SERVER_DIR"

# Install or update steam
[ "$UPDATE_SERVER" == "true" ] && steamcmd +force_install_dir "$SERVER_DIR" +login anonymous +app_update 1829350 validate +quit

DISPLAY=:0.0 tini -s -- xvfb-run -a wine VRisingServer.exe -persistentDataPath "Z:${DATA_DIR}"