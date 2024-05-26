# macOS Temporary Files Cleaner

This open-source Bash script is designed to clean various types of files and directories on your macOS system. It helps in freeing up disk space by removing logs, cache files, `.DS_Store` files, and other unnecessary temporary files. It also restarts network services, cleans Time Machine snapshots, updates the Spotlight index, and cleans Dock data sources to ensure your system runs smoothly.

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

