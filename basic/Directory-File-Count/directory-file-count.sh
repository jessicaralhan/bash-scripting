#!/bin/bash

directory="/path/to/directory"

# Count files
file_count=$(find "$directory" -type f | wc -l)

# Count directories
dir_count=$(find "$directory" -type d | wc -l)

# Display the results
echo "Number of files: $file_count"
echo "Number of directories: $dir_count"
