#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

find "$1" -type f -name "*.log" -mtime +7 -print0 | tar --null -czf logs_$(date +%Y%m%d).tar.gz --files-from - && find "$1" -type f -name "*.log" -mtime +7 -delete

echo "Log files archived and old files deleted."
