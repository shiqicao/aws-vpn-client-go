#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Specify the absolute path to the script you want to run
SCRIPT="${SCRIPT_DIR}/aws-vpn-client"

while true
do
    if [ -f "$SCRIPT" ]; then
        # Run the script
        bash -c "$SCRIPT serve --config ${HOME}/.config/vpn/vpn.conf"
        echo "Script has exited with a status of $?. Restarting script..." >&2
    else
        echo "Script file not found: $SCRIPT" >&2
        exit 1
    fi
    # Wait before restart
    sleep 1
done
