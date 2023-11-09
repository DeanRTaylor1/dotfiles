#!/bin/bash

cpu_usage=$(top -n 1 | awk '/Cpu/ {print $2}')
ram_usage=$(free -m | awk '/Mem/ {print $3}')

echo "CPU: $cpu_usage% | RAM: ${ram_usage}MB"

