#!/bin/bash

#we need to give a directory path when running the script..
DIRECTORY="${1}"

#must be root to run the script.
WHOAMI=$(whoami)

#s3 bucket name, in which alb logs are stored.
S3_BUCKET_NAME="my-loadbalancer-logs"

#aws account number.
AWS_ACCOUNT_NUMBER="44444444444444"

#aws region
REGION="your-region-name"

#give the format of the log file name, so it can be compressed, must be in below format.
FILE_NAME="accont-number_elasticloadbalancing_region_.app_load_balancer_name*"

#this will check if we are running the script as a root or not.
if [ "$WHOAMI" != "root" ]; then
  echo "Please run this script as root, exiting"
  exit 1
fi
#this is to check if we have given a directory option while running the script.
if [[ ! -e "${DIRECTORY}" ]]
then
 echo "Please Provide a Directory."
  exit 1
fi

#please give the below options according to the date of logs to download.
echo "Please Enter Year, month & day of logs."
sleep 1s
#Here we will give the year,month & day of the logs to be downloaded.
echo
echo "Enter Year:"
read YEAR
echo "Enter Month:"
read Month
echo "Enter Day:"
read Day
echo
#This will clean the logs directory.
cd ${DIRECTORY}
 rm * . &>/dev/null

echo 'Now we will download latest logs from the S3 bucket'
aws s3 sync s3://S3_BUCKET_NAME/loadbalancer-name/AWSLogs/elasticloadbalancing/$REGION/$YEAR/$Month/$Day .   &>/dev/null
sleep 1s
echo

echo 'Latest logs have been downloaded'
echo
#Now we will unzip the downloaded files.
gzip -d $FILE_NAME . &>/dev/null

##Once the logs has been downloaded we can exit the script.
exit 1

