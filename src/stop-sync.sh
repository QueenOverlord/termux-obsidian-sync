#!/bin/bash

# --- Obsidian Post-Use Synchronization Script ---
#
# Author: Polliana Pavloski
# Version: 1.0
#
# This script saves all local changes from an Obsidian session by
# adding, committing, and pushing them to the remote Git repository.
# It is designed to be run AFTER closing the Obsidian application.

# --- CONFIGURATION ---
# Set the full path to your Obsidian vault Git repository.
# IMPORTANT: Replace this with the actual path on your device.
VAULT_PATH="/data/data/com.termux/files/home/storage/shared/Documents/Obsidian"

# --- EXECUTION ---

echo "--- Starting Post-Use Synchronization ---"

# Navigate to the vault directory. The script will exit if this fails.
cd "$VAULT_PATH" || { echo "ERROR: Vault path not found. Exiting."; exit 1; }

echo "Adding all changes to the staging area..."
# Add all new, modified, and deleted files to the Git staging area.
git add .

# Check if there are any changes to commit.
if git diff-index --quiet HEAD; then
    echo "No changes to commit. Vault is already up-to-date."
else
    # Create a commit with a standardized message including the current date and time.
    COMMIT_MESSAGE="Sync: Mobile vault update on $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Committing changes with message: '$COMMIT_MESSAGE'..."
    git commit -m "$COMMIT_MESSAGE"

    echo "Pushing changes to the remote repository..."
    # Push the new commit to the 'master' branch of the remote 'origin'.
    git push origin master
fi

echo "--- Synchronization complete. All changes saved. ---"
