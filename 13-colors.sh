#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
        echo "please run this script with root preveleges"
        exit 1
    fi    
}
#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$1 is ...$R FAILED $N"
        exit1
    else
        echo -e "$2 is ...$G success $N"
        fi     
}

CHECK_ROOT 

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

