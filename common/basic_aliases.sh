##########################################################################################
####### BASIC USEFUL ALIASES - NOT WEB RELATED ###########################################
##########################################################################################

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

#### Format Terminal default line with the git branch if needed
PROMPT_DIRTRIM=2; # Shortend folder path in terminal to 2 level
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\e[33m\]$(parse_git_branch)\[\e[00m\]$ '; # Only print username in terminal (hide group)

#### Folder Navigation
alias c='clear';
alias ll='ls -lha';
alias ..='cd ..';
alias ...='cd ../..';
alias ....='cd ../../..';

#### Explorer
# Open folder in paramters #1 in windows File explorer
# Ex: open .
open() {
    explorer.exe "$1";
}