#!/bin/bash

echo "Enter the directory path:"
read dir_path

echo "Enter the username:"
read user_name

log_file="ownership_issues.log"
echo "Files not owned by $user_name:" > $log_file

find "$dir_path" -type f | while read file; do
    file_owner=$(ls -l "$file" | awk '{print $3}')
    if [ "$file_owner" != "$user_name" ]; then
        echo "$file" >> $log_file
    fi
done

echo "Check $log_file for files not owned by $user_name."
