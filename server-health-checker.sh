#!/bin/bash

CPU_THRESHOLD=80   
MEMORY_THRESHOLD=80 

SERVICE="apache2"

LOG_FILE="server_health.log"

check_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $cpu_usage%" >> "$LOG_FILE"
    if [ $(echo "$cpu_usage > $CPU_THRESHOLD" | bc) -eq 1 ]; then
        echo "ALERT: CPU usage exceeded threshold of $CPU_THRESHOLD%!" >> "$LOG_FILE"
    
    fi
}

check_memory_usage() {
    memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Memory Usage: $memory_usage%" >> "$LOG_FILE"
    if [ $(echo "$memory_usage > $MEMORY_THRESHOLD" | bc) -eq 1 ]; then
        echo "ALERT: Memory usage exceeded threshold of $MEMORY_THRESHOLD%!" >> "$LOG_FILE"
        
    fi
}

check_service_status() {
    service_status=$(systemctl is-active "$SERVICE")
    echo "Service ($SERVICE) status: $service_status" >> "$LOG_FILE"
    if [ "$service_status" != "active" ]; then
        echo "ALERT: Service $SERVICE is not running!" >> "$LOG_FILE"
       
    fi
}

check_cpu_usage
check_memory_usage
check_service_status

echo "Server health check completed. Check $LOG_FILE for details."
