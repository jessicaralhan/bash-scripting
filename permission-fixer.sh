#!/bin/bash

directory=$1

if [ -z "$directory" ]; then
  echo "Please provide a directory."
  exit 1
fi

if [ ! -d "$directory" ]; then
  echo "The directory does not exist."
  exit 1
fi

find "$directory" -type f -name "*.txt" -exec chmod 644 {} \;

echo "Permissions for .txt files in '$directory' have been fixed to 644."
