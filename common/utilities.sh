#### Utilities

tt_update() {
    imhere=$(pwd);
    cd $tt_aliasFolder;

    echoStart "Update TT's Aliases" "lblue";

    echo;
    echoColor "GIT pull...." "yellow";
    git reset --hard;
    git pull;

    echoSuccess "TT's Aliases are now up-to-date";

    # Display new version
    tt_version_display;

    cd $imhere;
    unset imhere;
}

tt_version_display() {
    tt_sourceSilent;
    echo;
    echoColor "TT version is now: \e[33m${tt_version}\e[39m" "purple";
    echo;
}

#### RESource Bash file
tt_source() {
    tt_sourceSilent;
    echoSuccess "Re-source bash file";
}

tt_sourceSilent() {
    source ~/.bashrc;
}
