#!/bin/bash
##########################################################################################
# CUSTOM ECHO BASH FUNCTIONS
# Provides colored output and formatted messaging utilities
##########################################################################################

# Color codes for terminal output
declare -A COLORS=(
    ["black"]="30"
    ["red"]="31"
    ["green"]="32"
    ["yellow"]="33"
    ["dblue"]="34"
    ["purple"]="35"
    ["lblue"]="36"
    ["white"]="37"
)

# Default color (white)
DEFAULT_COLOR="37"

##########################################################################################
# CORE COLOR FUNCTION
##########################################################################################

echoColor() {
    local message="$1"
    local color="${2:-white}"
    
    # Validate input
    if [[ -z "$message" ]]; then
        echo "Error: echoColor requires a message parameter" >&2
        return 1
    fi
    
    # Get color code, fallback to default if not found
    local color_code="${COLORS[$color]:-$DEFAULT_COLOR}"
    
    # Output colored message
    echo -e "\e[${color_code}m${message}\e[39m"
}

##########################################################################################
# FORMATTED MESSAGE FUNCTIONS
##########################################################################################

echoStart() {
    local message="$1"
    
    if [[ -z "$message" ]]; then
        echo "Error: echoStart requires a message parameter" >&2
        return 1
    fi
    
    echo
    echoColor "🏁 START - ${message}" "green"
    echoSeparator
}

echoSuccess() {
    local message="$1"
    
    if [[ -z "$message" ]]; then
        echo "Error: echoSuccess requires a message parameter" >&2
        return 1
    fi
    
    echo
    echoSeparator
    echoColor "✨ SUCCESS ✨ - ${message}" "green"
    echoSeparator
    echo
}

echoWarning() {
    local message="$1"
    
    if [[ -z "$message" ]]; then
        echo "Error: echoWarning requires a message parameter" >&2
        return 1
    fi
    
    echo
    echoColor "⚠️ WARNING ⚠️ - ${message}" "red"
    echo
}

echoHelpLine() {
    local label="$1"
    local description="$2"
    
    if [[ -z "$label" || -z "$description" ]]; then
        echo "Error: echoHelpLine requires both label and description parameters" >&2
        return 1
    fi
    
    echoColor "${label}  -  \e[34m${description}\e[39m" "lblue"
}

echoSeparator() {
    echoColor "------------------------------------------------------------------"
}

##########################################################################################
# TESTING AND UTILITY FUNCTIONS
##########################################################################################

tt_testColorPrint() {
    echo "Testing all available colors:"
    echo "=============================="
    
    for color in "${!COLORS[@]}"; do
        echoColor "-Color ${color^}-" "$color"
    done
    
    echo
    echo "Testing formatted functions:"
    echo "============================"
    echoStart "This is a start message"
    echoSuccess "This is a success message"
    echoWarning "This is a warning message"
    echoHelpLine "Test Label" "Test Description"
}