#!/bin/bash

USERID=$(id -u)
#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$1 is ...FAILED"
        exit1
    else
        echo "$2 is ...success"
        fi     
}

if [ $USERID -ne 0 ]
then
    echo "please run this script with root priveleges"
    exit 1

fi 

dnf list installed git

VALIDATE $? "listing git"

if [ $? -ne 0 ]
then
    echo "git is not installed,going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
     echo "git is already installed,nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed...going to install"
    dnf install mysql -y
     VALIDATE  $? "Installing MYSQL"
 else    
     echo "mysql is already installed..nothing to do"
 fi      

