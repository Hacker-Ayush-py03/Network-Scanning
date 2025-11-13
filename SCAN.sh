#!/bin/bash
 # Network Port Scanner
 # Author: [Your Name]
 # Date: $(date +%Y-%m-%d)

 # Install dependencies
echo "Installing required tools..."
sudo apt update && sudo apt install -y nmap xsltproc

 # Get local IP range
ip_range=$(ip route | grep -oP '(\d+\.){3}\d+/\d+' | head -1)
echo "Detected IP range: $ip_range"

 # Run scan and generate reports
timestamp=$(date +%Y%m%d_%H%M%S)
echo "Starting TCP SYN scan..."
nmap -sS "$ip_range" -oA scan_$timestamp

 # Convert to HTML
xsltproc scan_$timestamp.xml -o report_$timestamp.html

echo "Scan completed!"
echo "• Text report: scan_$timestamp.nmap"
echo "• HTML report: report_$timestamp.html"
echo "• XML data: scan_$timestamp.xml"
