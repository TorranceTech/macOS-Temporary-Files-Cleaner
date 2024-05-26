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

# Removing .DS_Store files
echo -n "Removing .DS_Store files..."
find / -name '.DS_Store' -type f -delete
echo -e "${GREEN}Done!${NC}"

# Cleaning cache files
echo -n "Cleaning cache files..."
safe_rm ~/Library/Logs/
safe_rm ~/System/Library/Caches/
safe_rm ~/Library/Caches
safe_rm /Library/Caches
safe_rm /System/Library/Caches
safe_rm /Users/$(whoami)/Library/Caches
echo -e "${GREEN}Done!${NC}"

# Restarting network services
echo -n "Restarting network services..."
killall -HUP mDNSResponder
echo -e "${GREEN}Done!${NC}"

# Cleaning system logs and crash reports
echo -n "Cleaning system logs and crash reports..."
safe_rm /var/log
safe_rm ~/Library/Logs
safe_rm /Library/Logs
safe_rm ~/System/Library/Caches/
safe_rm ~/Library/Logs/CrashReporter/CoreCapture
safe_rm ~/Library/Logs/CrashReporter
safe_rm ~/Library/Logs/Microsoft/InstallLogs
safe_rm ~/Library/Containers/com.microsoft.errorreporting
safe_rm ~/Library/Caches/com.adobe.AdobeCRDaemon
safe_rm ~/Library/Caches/com.google.GoogleUpdater
safe_rm ~/Library/Caches/com.adobe.CCXProcess
safe_rm ~/Library/Containers/com.adobe.accmac.ACCFinderSync
safe_rm ~/Library/Logs/DiagnosticReports
safe_rm /Library/Logs/DiagnosticReports
echo -e "${GREEN}Done!${NC}"

# Cleaning temporary files
echo -n "Cleaning temporary files..."
echo -n "Cleaning out Cache files..."
rm -rfv ~/Library/Caches/*
rm -f -PR /System/Library/Caches/*
rm -f -PR /Library/Containers/com.microsoft.errorreporting/*
rm -f -PR ~/Library/Caches/*
rm -f -PR /Library/Caches/*
killall -HUP mDNSResponder
discoveryutil udnsflushcaches
safe_rm /private/var/folders
echo -e "${GREEN}Done!${NC}"

# Removing items from trash
echo -n "Removing items from trash..."
safe_rm ~/.Trash
echo -e "${GREEN}Done!${NC}"

# Cleaning Time Machine snapshots
echo -n "Cleaning Time Machine snapshots..."
tmutil listlocalsnapshots / | grep 'com.apple.TimeMachine' | while read -r snapshot; do
    sudo tmutil deletelocalsnapshots "${snapshot##* }"
done
echo -e "${GREEN}Done!${NC}"

# Updating Spotlight index
echo -n "Updating Spotlight index..."
sudo mdutil -E /
echo -e "${GREEN}Done!${NC}"

# Cleaning Dock data sources
echo -n "Cleaning Dock data sources..."
killall Dock
echo -e "${GREEN}Done!${NC}"

# Adding a free space check after cleaning
FREE_SPACE=$(df -h / | tail -1 | awk '{print $4}')
echo -e "${GREEN}Free space after cleaning: $FREE_SPACE${NC}"

