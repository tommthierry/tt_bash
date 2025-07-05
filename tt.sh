##########################################################################################
####### TT "BASH SOFTWARE" ##############################################################
##########################################################################################

####### DO NOT TOUCH THIS ################################################################
##########################################################################################

tt() {
    if [[ '' == "$@" ]]; then
        echo;
        echoSeparator;
        echoColor "Welcome to TT's bash functions system 🤖" "green";
        echoColor "Current version : \033[1m${tt_version}" "lblue";
        echoColor "Copyright (c) - TT" "purple";
        echoSeparator;
        tt_helper;
        return;
    fi;

    if [ '-h' == "$1" ] || [ '-v' == "$1" ]; then
        echo;
        echoSeparator;
        echoColor "Welcome to TT's bash functions system" "green";
        echoColor "Current version : \033[1m${tt_version}" "lblue";
        echoColor "Copyright (c) - TT" "purple";
        echoSeparator;

        if [ '-v' != "$@" ]; then
            tt_helper;
        fi;
    else
        # Check function exist under the namespace tt_
        if [[ $(type -t tt_$1) == function ]]
        then
            ttFunction="tt_${1}";

            # Add all available parameters
            $ttFunction "${*:2}";
        else
            echoWarning "Function $1 does not exist";
        fi;
    fi;
}

# auto complete helper, second argument is a grep against the function list
tt_helper() {
    echo;
    echoColor "How To" "yellow";
    echoSeparator;
    echoColor "All of the commands run under the \e[35mtt\e[37m namespace" "blue";
    echoColor "Note: Autocomplete is in place" "blue";
    echoColor "Exemple:  \e[35mtt project start" "blue";

    echo;
    echo;
    echoColor "TT software tools" "yellow";
    echoSeparator;
    echoHelpLine "update" "Update TT software to the latest version available";
    echoHelpLine "source" "Resource bashrc file to consider modifications";

    # echo;
    # echo;
    # echoColor "Docker / Local Project" "yellow";
    # echoSeparator;
    # echoHelpLine "start" "Start docker containers for a magento project; --xdebug can be passed as parameter to start project with xDebug enable";
    # echoHelpLine "kill" "Remove docker containers for a magento project";


    if [ $tt_expertMode -eq 1 ]; then
        echo;
        echoColor "EXPERT" "yellow";
        echoSeparator;

        echoHelpLine "editAliases" "Open TT's aliases in VSCode";

        echo;
        echo;
    fi;

}



## Auto-complete for params tt functions
_tt_complete()
{
    # list of options for your script
    local options="npm composer symfony start kill install update source";

    if [ $tt_expertMode -eq 1 ]; then
        local end_options="${options} editAliases dockerConnectPHP dockerConnectPHPRoot dockerConnectNginx dockerConnectNginxRoot";
    else
        local end_options="${options}";
    fi;

    # current word being completed (provided by stock bash completion)
    local current_word="${COMP_WORDS[COMP_CWORD]}"

    # create list of possible matches and store to ${COMREPLY[@}}
    COMPREPLY=($(compgen -W "${end_options}" -- "$current_word"))
}
complete -F _tt_complete tt;
