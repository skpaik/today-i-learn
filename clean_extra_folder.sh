#!/bin/bash

# Exit if any command fails
set -e

# List of folder names you want to delete
# FOLDERS_TO_DELETE=("node_modules" ".venv")  # Add more folder names here later
FOLDERS_TO_DELETE=("node_modules" ".venv" ".pytest_cache" "dist" "build")

echo "Searching for folders to delete: ${FOLDERS_TO_DELETE[*]}"

for folder in "${FOLDERS_TO_DELETE[@]}"; do
    echo "Looking for '$folder'..."
    find . -type d -name "$folder" -prune -exec rm -rf {} + -print
done

echo "Cleanup completed successfully!"
