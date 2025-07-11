#!/bin/bash
##########################################################################################
# GLOBAL FUNCTIONS - Useful utility functions for common tasks
# 
# Author: TT
# Copyright (c) - TT
##########################################################################################

##########################################################################################
# ZONE.IDENTIFIER CLEANUP FUNCTION
##########################################################################################

# Remove all Zone.Identifier files from specified directory
# Usage: removeZoneIdentifiers [directory]
# If no directory is provided, defaults to current directory
removeZoneIdentifiers() {
    local target_dir="${1:-.}"
    
    # Check if directory exists
    if [[ ! -d "$target_dir" ]]; then
        echoError "Directory '$target_dir' does not exist"
        return 1
    fi
    
    # Convert to absolute path for cleaner display
    local abs_path=$(realpath "$target_dir")
    
    echo
    echoColor "Removing Zone.Identifier files from: $abs_path" "blue"
    echoSeparator
    
    # Find and count Zone.Identifier files
    local zone_files=$(find "$target_dir" -name "*Zone.Identifier" -type f 2>/dev/null)
    local count=$(echo "$zone_files" | grep -c . 2>/dev/null || echo "0")
    
    if [[ $count -eq 0 ]]; then
        echoSuccess "No Zone.Identifier files found"
        return 0
    fi
    
    # Show files to be removed
    echoColor "Found $count Zone.Identifier file(s):" "yellow"
    echo "$zone_files" | while read -r file; do
        if [[ -n "$file" ]]; then
            echoColor "  • $(basename "$file")" "gray"
        fi
    done
    
    echo
    echoColor "Removing files..." "blue"
    
    # Remove the files
    local removed_count=0
    echo "$zone_files" | while read -r file; do
        if [[ -n "$file" ]] && [[ -f "$file" ]]; then
            if rm "$file" 2>/dev/null; then
                removed_count=$((removed_count + 1))
            else
                echoError "Failed to remove: $file"
            fi
        fi
    done
    
    echoSuccess "Zone.Identifier cleanup completed"
    echo
}

##########################################################################################
# EXPORT FUNCTIONS
##########################################################################################

# Export functions for use in other scripts
export -f removeZoneIdentifiers 