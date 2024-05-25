# macOS Temporary Files Cleaner

This open-source Bash script is designed to clean temporary files from your macOS system. It helps in freeing up disk space by removing logs, cache files, `.DS_Store` files, Time Machine snapshots, and other unnecessary temporary files. It also updates the Spotlight index and cleans Dock data sources to ensure your system runs smoothly.

## Features

- Removes `.DS_Store` files.
- Cleans cache directories.
- Restarts network services.
- Cleans system logs and crash reports.
- Removes temporary files.
- Empties the Trash.
- Cleans Time Machine snapshots.
- Updates Spotlight index.
- Cleans Dock data sources.
- Provides a summary of free disk space after cleaning.

- Supported macOS Versions: 10.3 up to 14.5

macOS 10.3 (Panther) and later versions up to macOS 14.5 Sonoma.
- Important Note:
Please note that some files may require administrator permissions to be deleted. These files are typically system-related or protected, and the script will skip them to prevent any unintended consequences. It's recommended to run the script with superuser privileges (sudo ./clean_mac_temp_files.sh) to ensure proper access and cleaning of temporary files.

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
