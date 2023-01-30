#!/bin/bash

###
# This is a bash script that automatically creates a NODE.JS dummy function straight to the configured aws region
#
# This script requires awscli and others in order to function properly
#
# To invoke this function and use it:
# $ bash auto_run_simple.sh 
# $ ./auto_run_simple
#
#####


##
# program title
echo "_________________________________________"
echo "AWS - Automatic [SIMPLIFIED] Dummy Lambda Function"
echo "written by sebistj, 27/01/23"
echo "last update, 30/01/23"
echo "_________________________________________"

# dynamic params
PARAM_REGION="ap-southeast-1"
PARAM_ROLE="dummy_role1"
PARAM_NAME="dummy_function1"
PARAM_RUNTIME="nodejs16.x"

# sample params
PARAM_RUNTIME1="nodejs"
PARAM_RUNTIME2="nodejs14.x"
PARAM_RUNTIME3="nodejs16.x"
DEFAULT_REGION="ap-southeast-1"
MUMBAI_REGION="ap-south-1"





##
# init
echo ""
echo "configuring the AWS ..."

echo "REGION is set to: $PARAM_REGION "

echo "configuring the connection ..."

# Configure the AWS CLI to use the region
aws configure set default.region $PARAM_REGION

# error checking for connection?

# AWS CLI command: create role

ROLE_PATH="role_folder/test-role-policy.json"

echo "Creating role: $rolename"
echo "using role path: $ROLE_PATH"
echo "Writing rolename to variable to be used ..."
#aws iam create-role --role-name Test-Role --assume-role-policy-document file://test-role-policy.json
#aws iam create-role --role-name $PARAM_ROLE --asume-role-polic-document file://$ROLE_PATH

outputARN="ARN ouput"
outputARN=$(aws iam create-role --role-name $PARAM_ROLE --assume-role-policy-document file://$ROLE_PATH)
echo $outputARN >> arn_folder/outputARN.txt

# example output as ARN:
# --role arn:aws:iam::123456789012:role/service-role/MyTestFunction-role-tges6bf4

echo "role has been created successfully and saved to the file: /arn_folder/outputARN.txt"

echo ""
echo "==========================================================="
echo "ARN: $outputARN"
echo "==========================================================="
echo ""

# sample ARN
# "Arn": "arn:aws:iam::354557032487:role/Test-Role",
#        "RoleId": "AROAVFDJ67ATUNTFHI6JE"
#

#role:
# --role arn:aws:iam::354557032487:role/Test-Role
# --role arn:aws:iam::354557032487:role/Test-Role


# need to get the arn information to make the lambda function
#fileARN=$(grep -Eo "$PARAM_ROLE" file:/arn_folder/outputARN.txt)
#fileARN=$(grep -o '"Arn":.*' file://arn_folder/outputARN.txt | cut -d'"' -f4)
#fileARN=$(grep -o '"$PARAM_ROLE":.*' file:/arn_folder/outputARN.txt | cut -d'"' -f4)
fileARN=$(grep -o '"Arn":.*' file:/arn_folder/outputARN.txt | cut -d'"' -f4)
echo "fileARN: $fileARN"
useARN=fileARN


# handler name:
useHandler="handler.lambda_handler"

# file zip path
usePath="lambda_folder/lambda.zip"

# create lambda function 
echo "Creating lambda function with name $PARAM_NAME"
echo "chosen runtime, ARN, handler"
echo "runtime: $PARAM_RUNTIME"
echo "role ARN: $outputARN"
echo "file ARN: $useARN"
echo "handler: $useHandler"
# aws lambda create-function --function-name test_cli --runtime python3.6 --role new_test_cli_role --handler handler.lambda_handler --zip-file fileb://lambda.zip
# aws lambda create-function --function-name test_cli --runtime python3.6 --role arn:aws:iam::354557032487:role/Test-Role --handler handler.lambda_handler --zip-file fileb://lambda.zip
# aws lambda create-function --function-name $PARAM_NAME --runtime python3.6 --role arn:aws:iam::354557032487:role/Test-Role --handler handler.lambda_handler --zip-file fileb://lambda.zip

aws lambda create-function --function-name $PARAM_NAME --runtime $PARAM_RUNTIME --role $useARN --handler $useHandler --zip-file fileb://$usePath


# layer arn:

# python & dynamodb
# arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1

# python & mysql
# arn:aws:lambda:ap-south-1:354557032487:layer:bangkok_petHotel:1

# nodejs14-16 
# arn:aws:lambda:ap-south-1:354557032487:layer:clientdynamodb:2


# need layer ARN from Singapore ...

# singapore python ARN

# singapore nodejs 14,16 ARN
# arn:aws:lambda:ap-southeast-1:354557032487:layer:client-dynamodb:1
# singapore other ARN


useSourceARN="arn:aws:lambda:ap-southeast-1:354557032487:layer:client-dynamodb:1"

echo "Attaching ARN layer to Lambda Function"

echo "Source ARN: $useSourceARN"

# attempt to attach arn layer to lambda function
# aws lambda create-event-source-mapping (ARN) (function-name) [(enabled?), (batch-size), (starting-position), (start-pos-timestamp), (cli-input-json), (skeleton) ]
# aws lambda create-event-source-mapping --event-source-arn arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1 --function-name test_cli --enabled
aws lambda create-event-source-mapping --event-source-arn $useSourceARN --function-name $PARAM_NAME --enabled


echo "updating configuration"

# aws lambda update-function-configuration --function-name my-function \
# --layers arn:aws:lambda:us-east-2:123456789012:layer:my-layer:3 \
# arn:aws:lambda:us-east-2:111122223333:layer:their-layer:2
# aws lambda update-function-configuration --function-name my-function  --layers arn:aws:lambda:us-east-2:123456789012:layer:my-layer:3
# aws lambda update-function-configuration --function-name test_cli --layers arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1


echo "removal of layers?"
# to remove layers
# aws lambda update-function-configuration --function-name my-function --layers []

echo "kms key arn?"
# --kms-key-arn
# aws lambda update-function-configuration --function-name test_cli --kms-key-arn arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1



echo "FINISHED SCRIPT"

echo "exit"
