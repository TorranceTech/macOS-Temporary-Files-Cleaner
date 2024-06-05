#!/bin/bash

# Defining colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to check if the directory exists before attempting to clean it
safe_rm() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}Cleaning $1...${NC}"
        rm -rfv "$1"/*
    else
        echo -e "${RED}Directory $1 does not exist and will be ignored.${NC}"
    fi
}

# Function to clean external drives
clean_external_drives() {
    echo -e "${GREEN}Cleaning external drives...${NC}"
    for disk in $(diskutil list | grep 'external' | awk '{print $NF}'); do
        mount_point=$(diskutil info "$disk" | grep 'Mount Point' | awk -F': ' '{print $2}')
        if [ "$mount_point" != "Not mounted" ] && [ -n "$mount_point" ]; then
            echo -e "${GREEN}Cleaning $mount_point...${NC}"
            safe_rm "$mount_point"
        else
            echo -e "${RED}$disk is not mounted or mount point not found.${NC}"
        fi
    done
}

echo -n "Removing .DS_Store files..."
find / -name '.DS_Store' -type f -delete
echo -e "${GREEN}Done!${NC}"

echo -n "Cleaning cache files..."
safe_rm ~/Library/Logs/
safe_rm ~/System/Library/Caches/
safe_rm ~/Library/Logs/CrashReporter/CoreCapture
safe_rm ~/Library/Logs/CrashReporter
safe_rm ~/Library/Logs/Microsoft/InstallLogs
safe_rm ~/Library/Caches
safe_rm /Library/Caches
safe_rm /System/Library/Caches
safe_rm /Users/$(whoami)/Library/Caches
echo -e "${GREEN}Done!${NC}"

echo -n "Restarting network services..."
killall -HUP mDNSResponder
echo -e "${GREEN}Done!${NC}"

echo -n "Cleaning system logs and crash reports..."
safe_rm /var/log
safe_rm ~/Library/Logs
safe_rm /Library/Logs
safe_rm /Library/Logs/DiagnosticReports
echo -e "${GREEN}Done!${NC}"

echo -n "Cleaning temporary files..."
safe_rm /private/var/folders
echo -e "${GREEN}Done!${NC}"

echo -n "Removing items from trash..."
safe_rm ~/.Trash
echo -e "${GREEN}Done!${NC}"

echo -n "Cleaning Time Machine snapshots..."
tmutil listlocalsnapshots / | grep 'com.apple.TimeMachine' | while read -r snapshot; do
    sudo tmutil deletelocalsnapshots "${snapshot##* }"
done
echo -e "${GREEN}Done!${NC}"

echo -n "Updating Spotlight index..."
sudo mdutil -E /
echo -e "${GREEN}Done!${NC}"

echo -n "Cleaning Dock data sources..."
killall Dock
echo -e "${GREEN}Done!${NC}"

# Cleaning external drives
clean_external_drives

# Adding a free space check after cleaning
FREE_SPACE=$(df -h / | tail -1 | awk '{print $4}')
echo -e "${GREEN}Free space after cleaning: $FREE_SPACE${NC}"
