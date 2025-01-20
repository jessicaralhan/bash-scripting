#!/bin/bash

PORT=$1
KILL_PROCESS=$2

if [ -z "$PORT" ]; then
  echo "Please provide a port number."
  exit 1
fi

check_port_usage() {

    pid=$(netstat -tuln | grep ":$PORT" | awk '{print $7}' | cut -d'/' -f1)
    
  
    if [ -z "$pid" ]; then
        echo "Port $PORT is not in use."
    else
        echo "Port $PORT is in use by process with PID: $pid."
        
        if [ "$KILL_PROCESS" == "kill" ]; then
            echo "Killing process with PID: $pid"
            kill -9 "$pid"
            if [ $? -eq 0 ]; then
                echo "Process with PID $pid terminated successfully."
            else
                echo "Failed to terminate the process."
            fi
        fi
    fi
}

check_port_usage
