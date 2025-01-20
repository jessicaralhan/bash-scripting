#!/bin/bash

# Step 1: Accept the log file as input
echo "Enter the log file path:"
read log_file

# Step 2: Output report file
report_file="error_report.txt"
echo "Error Summary Report" > $report_file

# Step 3: Extract error messages and count occurrences
grep -i "error" "$log_file" | awk -F ": " '{print $2}' | sort | uniq -c | while read count error_message; do
    echo "$error_message: $count occurrences" >> $report_file
done

# Step 4: Notify the user
echo "Report generated: $report_file"
