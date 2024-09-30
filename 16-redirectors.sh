#!/bin/bash/

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%h-%m-%s)
LOG_FILE="$LOGS_FOLDER_/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
        echo -e "$R please run this script with root preveleges $N" &>>LOG_FILE
        exit 1
    fi    
}
#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$1 is ... $R FAILED $N" &>>$LOG_FILE 
        exit1
    else
        echo  -e"$2 is ...$G success $N" &>>$LOG_FILE
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



