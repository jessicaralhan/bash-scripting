#!/bin/bash

read -p "Enter the file path: " file_path

sort "$file_path" | uniq > output.txt

echo "Duplicates removed. The output is saved in 'output.txt'."
