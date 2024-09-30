#!/bin/bash

USERID=$(id -u)
#echo "user id is: $USERID"

if [ $userid -ne 0]
then
    echo "please run this script with root priveleges"

fi 

dnf install git -y