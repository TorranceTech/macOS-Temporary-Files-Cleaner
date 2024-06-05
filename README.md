# macOS Temporary Files Cleaner

This open-source Bash script is designed to clean various types of files and directories on your macOS system. It helps in freeing up disk space by removing logs, cache files, `.DS_Store` files, and other unnecessary temporary files. It also restarts network services, cleans Time Machine snapshots, updates the Spotlight index, and cleans Dock data sources to ensure your system runs smoothly.

### Update: Added External Drive and USB Cleaning Functionality
Changes Made:

### New Feature: External Drive and USB Cleaning

- Introduced a function clean_external_drives to detect and clean mounted external drives and USB devices.
- The script now scans for external devices, checks their mount points, and applies the safe_rm function to clean them.

### Improved Output Messages:

- Added color-coded output messages to indicate the status of each cleaning operation more clearly.
- 
### Refactoring and Cleanup:

- Refactored existing code for better readability and maintainability.
- Ensured that all primary cleaning operations are maintained and enhanced with the new external drive cleaning capability.

### Script Overview:

- The script performs comprehensive system cleaning, including cache files, logs, temporary files, Time Machine snapshots, and more.
- External drives and USB devices are now included in the cleaning process, ensuring that all connected storage devices are cleaned.

* Usage:

- Run the script as usual. The cleaning of external drives and USB devices will be handled automatically if they are detected and mounted.

# Example Output:

```
Removing .DS_Store files...Done!
Cleaning cache files...Done!
Restarting network services...Done!
Cleaning system logs and crash reports...Done!
Cleaning temporary files...Done!
Removing items from trash...Done!
Cleaning Time Machine snapshots...Done!
Updating Spotlight index...Done!
Cleaning Dock data sources...Done!
Cleaning external drives...
Cleaning /Volumes/ExternalDrive1...Done!
Cleaning /Volumes/USBDevice1...Done!
Free space after cleaning: 50G

```
- This update significantly enhances the script's functionality, making it a more robust and versatile cleaning tool for macOS systems. 


## Features

- Removes `.DS_Store` files.
- Cleans cache directories.
- Restarts network services.
- Cleans system logs and crash reports.
- Removes temporary files.
- Removes File Remnants
- Empties the Trash.
- Cleans Time Machine snapshots.
- Updates Spotlight index.
- Cleans Dock data sources.
- Provides a summary of free disk space after cleaning.

- Supported macOS Versions
This script should work on most versions of macOS.

- Important Note:
Please note that some files may require administrator permissions to be deleted. These files are typically system-related or protected, and the script will skip them to prevent any unintended consequences. It’s recommended to run the script with superuser privileges (sudo ./clean_mac_temp_files.sh) to ensure proper access and cleaning of temporary files.

## Installation and Usage

### Download the Script
Download the script from the GitHub repository.

### Save the Script
Save the script to your desired location on your macOS system.

### Make the Script Executable
Open Terminal and navigate to the script's directory. Run the following command to make the script executable:

```bash
chmod +x clean_mac_temp_files.sh
```
```bash
sudo ./clean_mac_temp_files.sh
```
![Screenshot 2024-05-25 at 7 18 28 AM](https://github.com/TorranceTech/macOS-Temporary-Files-Cleaner/assets/170806445/b785266f-2a04-4e44-92cc-eb2298e368db)

