#!/bin/bash

function main()
{
    if [ -z $1 ]
    then
        echo " " 
        read -p "Enter Column Width: " columns
        read -p "Enter Rows Height:  " rows
        setcolumns $columns
        setrows $rows
    else
        setcolumns $1
        setrows $2
    fi
    killall Dock
}
function setcolumns() 
{
defaults write com.apple.dock springboard-columns -int $columns
}
function setrows() 
{
defaults write com.apple.dock springboard-rows -int $rows
}

main