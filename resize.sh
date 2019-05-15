#!/bin/bash

# manual usage, if script is run with no arguments the user is prompted for columns and rows
function manual()
{
    echo " " 
    read -p "Enter Column Width: " columns
    read -p "Enter Rows Height:  " rows
    setcolumns $columns
    setrows $rows
}

# arguments usage, if the script is run with arguments this function pushes those arguments to the setcolumns and setrows functions
function arguments()
{
    setcolumns $columns
    setrows $rows
}

# once the columns varaible is set, this makes the change on the launchpad
function setcolumns() 
{
defaults write com.apple.dock springboard-columns -int $columns 2> /dev/null
}

# once the rows variable is set, this makes the change on the launchpad
function setrows() 
{
defaults write com.apple.dock springboard-rows -int $rows 2> /dev/null
}

# usage, this has no purpose yet, redundant code as it is not called anywhere now I have added the manual feature.
function usage()
{
    echo "usage: ./resize <columns> <width>"
    echo "example: ./resize 8 8"
}

# if arguements are present then call the arguemtns function
if [[ -n $1 ]]
then
    columns=$1 ; rows=$2
    arguments $columns $rows
# else call the manual section.
else
    manual
fi
# this then restarts the dock/launchpad as that is required for the changes to make take effect.
killall Dock 2> /dev/null