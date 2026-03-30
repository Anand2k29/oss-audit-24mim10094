#!/bin/bash
# Author: Anand2k29 (24MIM10094)
# Description: Detects package manager, checks Firefox installation, extracts version,
# and prints philosophy notes for several FOSS tools.

# Function to detect the package manager.
detect_pkg_manager() {
    if command -v dpkg >/dev/null 2>&1; then
        echo "dpkg"
    elif command -v rpm >/dev/null 2>&1; then
        echo "rpm"
    elif command -v pacman >/dev/null 2>&1; then
        echo "pacman"
    else
        echo "unknown"
    fi
}

pkg_manager=$(detect_pkg_manager)

# Determine the correct package name for Firefox based on distro.
case "$pkg_manager" in
    dpkg)
        pkg_name="firefox"
        ;;
    rpm)
        # On Fedora the package is also named firefox
        pkg_name="firefox"
        ;;
    pacman)
        pkg_name="firefox"
        ;;
    *)
        pkg_name="firefox"
        ;;
esac

# Check installation status and retrieve version.
installed=false
version="N/A"

if [[ "$pkg_manager" == "dpkg" ]]; then
    if dpkg -s "$pkg_name" >/dev/null 2>&1; then
        installed=true
        version=$(dpkg -s "$pkg_name" | awk -F': ' '/^Version/ {print $2}')
    fi
elif [[ "$pkg_manager" == "rpm" ]]; then
    if rpm -q "$pkg_name" >/dev/null 2>&1; then
        installed=true
        version=$(rpm -q --queryformat '%{VERSION}-%{RELEASE}\n' "$pkg_name")
    fi
elif [[ "$pkg_manager" == "pacman" ]]; then
    if pacman -Qi "$pkg_name" >/dev/null 2>&1; then
        installed=true
        version=$(pacman -Qi "$pkg_name" | awk -F': ' '/^Version/ {print $2}')
    fi
fi

# Output header.
printf "================================================================================\n"
printf "                   Firefox AUDIT - PACKAGE INSPECTOR                 \n"
printf "================================================================================\n"

if $installed; then
    printf "Status: %s is INSTALLED on this %s system.\n" "$pkg_name" "$(uname -s)"
    printf "Version: %s\n" "$version"
else
    printf "Status: %s is NOT INSTALLED on this system.\n" "$pkg_name"
fi

printf "--------------------------------------------------------------------------------\n"
printf "FOSS Philosophy Notes:\n"

# Case statement for philosophy notes of four tools.
case "$1" in
    *)
        printf " - Firefox: A modern web browser that champions open standards and community-driven development.\n"
        printf " - LibreOffice: A full‑featured office suite that respects user freedom and data portability.\n"
        printf " - GIMP: An image manipulation program that provides professional capabilities without proprietary lock‑in.\n"
        printf " - VLC: A versatile media player that supports countless formats, all under a permissive license.\n"
        ;;
esac

printf "================================================================================\n"
