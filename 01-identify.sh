#!/bin/bash
# Author: Anand2k29 (24MIM10094)
# Description: System identification script for Firefox audit.
# This script gathers basic system information such as Linux distribution,
# kernel version, current user, home directory, system uptime, and the current
# date/time. It concludes with a hard‑coded message promoting Open Source freedom.

# Retrieve Linux distribution information from /etc/os-release if available.
if [[ -f /etc/os-release ]]; then
    # Source the file to import variables like PRETTY_NAME.
    . /etc/os-release
    distro="${PRETTY_NAME}"
else
    # Fallback to lsb_release if os-release is missing.
    distro=$(lsb_release -ds 2>/dev/null || echo "Unknown Distro")
fi

# Kernel version via uname.
kernel=$(uname -r)

# Current user and home directory.
current_user=$(whoami)
home_dir=$(eval echo "~$current_user")

# System uptime formatted nicely.
# The -p flag prints uptime in a human readable form.
uptime=$(uptime -p)

# Current date/time in the required format.
current_date=$(date "+%a %b %d %Y %H:%M:%S GMT%z (%Z)")

# Output the collected information with decorative borders.
printf "================================================================================\n"
printf "                   Firefox AUDIT - SYSTEM IDENTITY                    \n"
printf "================================================================================\n"
printf "Linux Distribution: %s\n" "$distro"
printf "Kernel Version:     %s\n" "$kernel"
printf "Current User:       %s\n" "$current_user"
printf "Home Directory:     %s\n" "$home_dir"
printf "System Uptime:      %s\n" "$uptime"
printf "Current Date/Time:  %s\n" "$current_date"
printf "--------------------------------------------------------------------------------\n"
printf "Message: This system runs on Open Source software, providing freedom to study, change, and distribute.\n"
printf "================================================================================\n"
