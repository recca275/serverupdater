Server Updater with MC world backup
===================================

This script is designed to automate server maintenance tasks for a Minecraft server. It performs the following actions:

1. **Backup Minecraft World**:
   - The script checks if the Minecraft world save file exists at the specified location.
   - If found, it copies the world folder to a specified NAS backup location.
   - A log of the backup process is recorded.

2. **Server Maintenance**:
   - If the current time is 04:00 AM (server time), the script performs the following actions:
     - Updates the server package list using `apt update`.
     - Upgrades installed packages to their latest versions using `apt upgrade -y`.
     - Reboots the server to apply any updates that require a restart.
   - If the current time is not 04:00 AM, the script skips the maintenance tasks and logs the skipped action.

Requirements:
-------------
- Linux server running Ubuntu or a similar distribution with `apt` package manager.
- A Minecraft world save folder that can be located at the specified path.
- A NAS (Network-Attached Storage) where Minecraft world backups will be stored.
- Write permissions to the log file (`/var/log/server_maintenance.log`), Minecraft world folder, and NAS backup location.

Configuration:
--------------
1. **Minecraft World Path**:
   - Update the `MINECRAFT_WORLD_PATH` variable to point to your Minecraft world save folder.

2. **NAS Path**:
   - Update the `NAS_PATH` variable to specify where you want to store the backups on your NAS.

3. **Log File**:
   - The log file is located at `/var/log/server_maintenance.log`. You can change the `LOGFILE` variable if you'd like the log to be saved elsewhere.

Usage:
------
1. Make the script executable by running the following command in the terminal:
   `chmod +x /path/to/script.sh`

2. To run the script, simply execute it with the following command:
   `./path/to/script.sh`

3. It is recommended to run the script automatically using a cron job to ensure the maintenance tasks are done regularly, especially during the specified time (04:00 AM).

Example Cron Job:
------------------
To run the script every day at 4:00 AM, add the following line to your crontab:

`0 4 * * * /path/to/script.sh`

This will ensure that the script runs at 4:00 AM daily, automatically checking for the world save and performing maintenance.

Log File Location:
------------------
All actions performed by the script are logged in the log file:
`/var/log/server_maintenance.log`

This includes backup logs and maintenance tasks (update/upgrade/reboot) logs.

Important Notes:
----------------
- Ensure that your NAS is properly mounted and accessible from the server before the backup attempt.
- The script will only back up the world if the world directory exists at the specified path.
- Regularly monitor the log file to verify that the backup and maintenance processes are functioning as expected.

For any issues or suggestions, feel free to modify the script as per your needs.

