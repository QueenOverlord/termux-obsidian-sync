#!/bin/bash

# --- Obsidian Pre-Use Synchronization Script ---
#
# Author: Polliana Pavloski
# Version: 1.0
#
# This script prepares the Obsidian vault for use by pulling the latest
# changes from the remote Git repository. It is designed to be run
# BEFORE opening the Obsidian application on Android.

# --- CONFIGURATION ---
# Set the full path to your Obsidian vault Git repository.
# IMPORTANT: Replace this with the actual path on your device.
VAULT_PATH="/data/data/com.termux/files/home/storage/shared/Documents/Obsidian"

# --- EXECUTION ---

echo "--- Starting Pre-Use Synchronization ---"

# Navigate to the vault directory. The script will exit if this fails.
cd "$VAULT_PATH" || { echo "ERROR: Vault path not found. Exiting."; exit 1; }

echo "Verifying repository status..."

# Pull the latest updates from the 'main' branch of the remote 'origin'.
# This ensures the local vault is in sync with the remote before use.
git pull origin main

echo "--- Synchronization complete. Ready to use Obsidian. ---"

