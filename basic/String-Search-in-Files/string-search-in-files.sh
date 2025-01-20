#!/bin/bash

echo "Enter the search string:"
read search_string

echo "Enter the directory path:"
read dir_path

grep -rnw "$dir_path" --include="*.log" -e "$search_string"
