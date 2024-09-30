#!/bin/bash

USERID=$(id -u)

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
        echo "$1 is ...FAILED"
        exit1
    else
        echo "$2 is ...success"
        fi     
}

CHECK_ROOT 
#sh 15-loops.sh git mysql postfix nginx
for package in $@ # refers to all arguments passed to it
do
   echo $package
done   