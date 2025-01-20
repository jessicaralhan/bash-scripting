#!/bin/bash

directory=$1

log_file="broken_symlinks.log"

if [ -z "$directory" ]; then
  echo "Please provide a directory."
  exit 1
fi

if [ ! -d "$directory" ]; then
  echo "The directory does not exist."
  exit 1
fi

find "$directory" -type l ! -exec test -e {} \; -print > "$log_file"

if [ -s "$log_file" ]; then
  echo "Broken symbolic links have been logged to '$log_file'."
else
  echo "No broken symbolic links found."
fi
