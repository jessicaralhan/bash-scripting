#!/bin/bash

log_file="disk_usage_warnings.log"
echo "Disk Usage Monitor Log" > $log_file

df -h | awk '{print $5 " " $6}' | grep -E '[0-9]+%' | while read usage partition; do
    usage_value=${usage%\%}
    if [ "$usage_value" -gt 80 ]; then
        echo "Warning: Partition $partition is $usage full!" >> $log_file
    fi
done

echo "Disk usage monitoring complete. Check $log_file for warnings."
