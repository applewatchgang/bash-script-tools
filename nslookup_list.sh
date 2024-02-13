#!/bin/bash

# Check if a file containing IPv4 addresses is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_with_ipv4_addresses>"
    exit 1
fi

file_path=$1

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "File not found: $file_path"
    exit 1
fi

# Loop through each IPv4 address in the file and perform nslookup
while IFS= read -r ip_address; do
    echo "Performing nslookup for $ip_address"
    nslookup "$ip_address"
    echo "--------------------------------------------"
done < "$file_path"
