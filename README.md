

# Introduction


# Installation process

## GIT 
https://github.com/tommthierry/tt_bash.git

2. Open folder in explorer
Open ~ folder in explorer to be able to edit files with VSC more easily with the following command
`explorer.exe .` 

3. Create .env.sh file based on .env.sample.sh file and update variable values

4. Add the following lines at the end of your ~/.bashrc file
```
################################################################
####### TT's BASH  #############################################
################################################################
if [ -f ~/tt_bash/_load_.sh ]; then
    . ~/tt_bash/load.sh
fi
```

5. Re-source the bash file with the following command to be able to use our era bash aliases
`source ~/.bashrc;`

6. Validate that everyting is fine by running this command `tt`


# Utilisation
- tt -v to get the version
- tt -h to check helper
- tt $1 to run a command


# ✨ Enjoy ✨
