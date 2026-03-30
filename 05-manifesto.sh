#!/bin/bash
# Author: Anand2k29 (24MIM10094)
# Description: Interactive script that builds a personalized Open Source manifesto.
# It asks three questions, assembles a paragraph, and appends it to a text file
# named after the current user (e.g., Anand2k29.txt).

# Prompt the user for their favorite FOSS project.
read -p "What is your favorite open-source project? " fav_project

# Prompt for a personal principle regarding software freedom.
read -p "State a personal principle you uphold in software development: " principle

# Prompt for a commitment statement.
read -p "How will you contribute to the open-source community? " commitment

# Construct the manifesto paragraph.
manifesto="I, $(whoami), believe that $fav_project embodies the spirit of collaboration and transparency. My guiding principle is: \"$principle\". To give back, I commit to: $commitment."

# Define the output file name based on the current user.
output_file="${USER}.txt"

# Append the manifesto to the file, creating it if it does not exist.
echo "$manifesto" >> "$output_file"

# Inform the user of the successful operation.
echo "Your manifesto has been saved to $output_file."
