##########################################################################################
####### LOAD TT ALIAS ####################################################################
##########################################################################################


# Global variables
. ~/tt_bash/variables.sh;

# User variable
. $tt_aliasFolder/.env.sh;


# Common
. $tt_aliasFolder/common/echo.sh;
. $tt_aliasFolder/common/basic_aliases.sh;
. $tt_aliasFolder/common/utilities.sh;
. $tt_aliasFolder/common/global_functions.sh;


# TT
####### Import TT "Software"
if [ -f $tt_aliasFolder/.env.sh ]; then

    . $tt_aliasFolder/tt.sh;

    if [ $tt_expertMode -eq 1 ]; then
        . $tt_aliasFolder/expert.sh;
    fi;
else
    echoWarning "You should set your .env.sh file for TT's bash aliases to work";
fi;
