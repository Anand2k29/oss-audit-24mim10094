#!/bin/bash
# Author: Anand2k29 (24MIM10094)
# Description: Analyzes a given log file for a specific keyword.
# Usage: ./04-logs.sh /path/to/logfile keyword
# The script counts how many times the keyword appears and then prints the
# last five matching lines.

# Verify that a log file argument was supplied.
if [[ -z "$1" ]]; then
    echo "Usage: $0 <log_file> <keyword>"
    exit 1
fi

log_file="$1"
keyword="${2:-}"

# Suggest a realistic Firefox log location (comment for documentation).
# Typical Firefox logs on Linux can be found under /var/log/firefox/ or in the user's
# profile directory as ~/.mozilla/firefox/*.log
# Example: /var/log/firefox/firefox.log

# Ensure the log file exists and is readable.
if [[ ! -r "$log_file" ]]; then
    echo "Error: Log file '$log_file' does not exist or is not readable."
    exit 2
fi

# Initialize a counter.
match_count=0

# Use a while‑read loop to process the file line by line.
# The IFS is set to empty to preserve leading/trailing whitespace.
while IFS= read -r line; do
    if [[ -n "$keyword" && "$line" == *"$keyword"* ]]; then
        ((match_count++))
        # Store matching lines in an array for later tailing.
        matches+=("$line")
    fi
done < "$log_file"

# Output the total count.
echo "Keyword '$keyword' found $match_count times in $log_file."

# If there are matches, display the last five.
if (( match_count > 0 )); then
    echo "Last 5 matching entries:"
    # Use printf to output the tail of the matches array.
    printf "%s\n" "${matches[@]}" | tail -n 5
fi
