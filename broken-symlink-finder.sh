#!/bin/bash

# Directory where you want to find broken symlinks
directory=$1

# Log file to store the broken symlink paths
log_file="broken_symlinks.log"

# Check if directory is provided
if [ -z "$directory" ]; then
  echo "Please provide a directory."
  exit 1
fi

# Check if the directory exists
if [ ! -d "$directory" ]; then
  echo "The directory does not exist."
  exit 1
fi

# Find broken symbolic links and log them
find "$directory" -type l ! -exec test -e {} \; -print > "$log_file"

# Check if any broken symlinks were found and logged
if [ -s "$log_file" ]; then
  echo "Broken symbolic links have been logged to '$log_file'."
else
  echo "No broken symbolic links found."
fi
