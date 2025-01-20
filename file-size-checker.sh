#!/bin/bash

echo "Enter the file path:"
read file

echo "Enter the size threshold in KB:"
read threshold

file_size=$(du -k "$file" | cut -f1)

if [ "$file_size" -gt "$threshold" ]; then
    echo "File size: ${file_size} KB. Warning: Exceeds threshold of ${threshold} KB!"
else
    echo "File size: ${file_size} KB. Within the threshold of ${threshold} KB."
fi
