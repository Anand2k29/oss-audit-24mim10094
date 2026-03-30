#!/bin/bash
# Author: Anand2k29 (24MIM10094)
# Description: Audits a set of system directories and Firefox‑specific paths.
# For each directory it reports size, permissions, and owner in aligned columns.

# Base directories to audit.
dirs=(
    "/etc"
    "/var/log"
    "/usr/share"
    "/opt"
)

# Append Firefox‑specific directories dynamically.
# System‑wide installation path.
dirs+=("/usr/lib/firefox")
# User profile directory (may contain multiple profiles; we take the default).
dirs+=("$HOME/.mozilla/firefox")

# Print table header.
printf "%‑30s %‑10s %‑10s %‑10s\n" "Directory" "Size" "Perms" "Owner"
printf "%‑30s %‑10s %‑10s %‑10s\n" "---------" "----" "-----" "-----"

# Iterate over each directory.
for dir in "${dirs[@]}"; do
    if [[ -d "$dir" ]]; then
        # Use du to get human‑readable size (summarize the directory).
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)
        # Use stat to fetch permissions and owner.
        perms=$(stat -c "%A" "$dir")
        owner=$(stat -c "%U" "$dir")
        # Print the information in columns.
        printf "%‑30s %‑10s %‑10s %‑10s\n" "$dir" "$size" "$perms" "$owner"
    else
        # Directory does not exist; indicate with N/A.
        printf "%‑30s %‑10s %‑10s %‑10s\n" "$dir" "N/A" "N/A" "N/A"
    fi
done
