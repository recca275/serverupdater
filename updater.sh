#!/bin/bash

LOGFILE="/var/log/server_maintenance.log"
MINECRAFT_WORLD_PATH="/path/to/minecraft/world"  # Update with the actual Minecraft world path
NAS_PATH="/mnt/nas/minecraft_backups"  # Update with the actual path to your NAS
CURRENT_HOUR=$(date +"%H")

# Check if the Minecraft world directory exists
if [ -d "$MINECRAFT_WORLD_PATH" ]; then
  echo "Minecraft world found. Backing up to NAS..." >> $LOGFILE
  # Copy the world folder to the NAS
  cp -r "$MINECRAFT_WORLD_PATH" "$NAS_PATH" >> $LOGFILE 2>&1
  echo "Minecraft world backup completed at $(date)" >> $LOGFILE
else
  echo "No Minecraft world found at $MINECRAFT_WORLD_PATH. Skipping backup." >> $LOGFILE
fi

# Check if it's time for maintenance
if [ "$CURRENT_HOUR" -eq "04" ]; then
  echo "Starting maintenance at $(date)" >> $LOGFILE
  sudo apt update >> $LOGFILE 2>&1
  sudo apt upgrade -y >> $LOGFILE 2>&1
  echo "Rebooting server at $(date)" >> $LOGFILE
  sudo reboot
else
  echo "Skipped maintenance at $(date). Current hour: $CURRENT_HOUR" >> $LOGFILE
fi