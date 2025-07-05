#!/bin/bash
##########################################################################################
# TT BASH SOFTWARE - Main Entry Point
# A comprehensive bash function system for development workflows
# 
# Author: TT
# Version: ${tt_version}
# Copyright (c) - TT
##########################################################################################

##########################################################################################
# CORE TT FUNCTION
##########################################################################################

tt() {
    local command="${1:-}"
    local args=("${@:2}")
    
    # Handle no arguments or help flags
    if [[ -z "$command" ]] || [[ "$command" == "-h" ]] || [[ "$command" == "--help" ]]; then
        tt_show_header
        tt_show_help
        return 0
    fi
    
    # Handle version flag
    if [[ "$command" == "-v" ]] || [[ "$command" == "--version" ]]; then
        tt_show_header
        return 0
    fi
    
    # Execute the requested function
    tt_execute_command "$command" "${args[@]}"
}

##########################################################################################
# HELPER FUNCTIONS
##########################################################################################

tt_show_header() {
    echo
    echoSeparator
    echoColor "Welcome to TT's bash functions system 🤖" "green"
    echoColor "Current version: \033[1m${tt_version}\033[0m" "lblue"
    echoColor "Copyright (c) - TT" "purple"
    echoSeparator
}

tt_show_help() {
    echo
    echoColor "Usage Guide" "yellow"
    echoSeparator
    echoColor "All commands run under the \e[35mtt\e[37m namespace" "blue"
    echoColor "Note: Autocomplete is available" "blue"
    echoColor "Example: \e[35mtt project start\e[37m" "blue"
    
    echo
    echoColor "Available Commands" "yellow"
    echoSeparator
    
    # Core commands
    echoColor "Core Tools:" "green"
    echoHelpLine "update" "Update TT software to the latest version"
    echoHelpLine "source" "Reload bashrc file to apply changes"
    echoHelpLine "version" "Display current TT version"
    echo
    
    # Development commands
    echoColor "Development:" "green"
    echoHelpLine "npm" "Run npm commands with enhanced output"
    echoHelpLine "composer" "Run composer commands with enhanced output"
    echoHelpLine "symfony" "Run Symfony console commands"
    echo
    
    # Docker commands
    echoColor "Docker:" "green"
    echoHelpLine "start" "Start docker containers for a project"
    echoHelpLine "kill" "Stop and remove docker containers"
    echoHelpLine "install" "Install project dependencies"
    echo
    
    # Expert mode commands
    if [[ $tt_expertMode -eq 1 ]]; then
        echo
        echoColor "Expert Mode:" "yellow"
        echoSeparator
        echoHelpLine "editAliases" "Open TT's aliases in VSCode"
        echoHelpLine "dockerConnectPHP" "Connect to PHP container"
        echoHelpLine "dockerConnectPHPRoot" "Connect to PHP container as root"
        echoHelpLine "dockerConnectNginx" "Connect to Nginx container"
        echoHelpLine "dockerConnectNginxRoot" "Connect to Nginx container as root"
    fi
    
    echo
    echoColor "For more information, use: tt <command> --help" "blue"
}

tt_execute_command() {
    local command="$1"
    local args=("${@:2}")
    local function_name="tt_${command}"
    
    # Check if function exists
    if [[ $(type -t "$function_name") == "function" ]]; then
        # Execute the function with all remaining arguments
        "$function_name" "${args[@]}"
    else
        echoWarning "Command '$command' does not exist"
        echoColor "Use 'tt --help' to see available commands" "blue"
        return 1
    fi
}

##########################################################################################
# AUTOCOMPLETION
##########################################################################################

_tt_complete() {
    local current_word="${COMP_WORDS[COMP_CWORD]}"
    local options="npm composer symfony start kill install update source version"
    
    # Add expert mode options if enabled
    if [[ $tt_expertMode -eq 1 ]]; then
        options="${options} editAliases dockerConnectPHP dockerConnectPHPRoot dockerConnectNginx dockerConnectNginxRoot"
    fi
    
    # Generate completion suggestions
    COMPREPLY=($(compgen -W "$options" -- "$current_word"))
}

# Register autocompletion
complete -F _tt_complete tt

##########################################################################################
# VERSION DISPLAY FUNCTION
##########################################################################################

tt_version() {
    tt_show_header
}

##########################################################################################
# EXPORT MAIN FUNCTION
##########################################################################################

# Export the main function for use in other scripts
export -f tt
