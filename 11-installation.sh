#!/bin/bash

USERID=$(id -u)
#echo "user id is: $USERID"

if [ $USERID -ne 0]
then
    echo "please run this script with root priveleges"
    exit 1

fi 

dnf list installed git

if [ $? -ne 0]
then
    echo "git is not installed,going to install it.."
    dnf install git -y
    if [ $? -ne o ]
    then
        echo "git installation is not sucess...check it"
        exit 1
    else
        echo "git installation is sucess"
    fi     
else
     echo "git is already installed,nothing to do.."
fi
    

