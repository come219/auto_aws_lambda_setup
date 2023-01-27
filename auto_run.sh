#!/bin/bash

###
# This is a bash script that automatically creates a dummy function straight to the configured aws region
#
# This script requires awscli, jq and others in order to function properly
#
# To invoke this function and use it:
# $ bash dummy_awscli.sh {param0} {param1}
# $ ./dummy_awscli {param0} {param1} ...
#
# param 0 : configured region
# param 1 : role name
# param 2 : function name
# param 3 : ...
# param 4 : ...
#
#
#####

##
# fun: args_check param1 param2
# txt: check for arguments when execution
# opt: num1: configured region
# opt: num2: role name
# use: bash dummy_awscli.sh -a abc -b def
# api: echo, if-else-fi
args_check() {

	echo "args check"
	##
	# arugments check
	#
	#
	if [ $# -eq 0 ]; then
		echo "Usage: scriptname param1 param2 param3"
		exit 1
	else
		echo "Command executed successfully with parameters: $@"
	fi

}

# args_check()

##
# arugments check
#
if [ $# -eq 0 ]; then
  echo "Usage: scriptname param1 param2 param3"
  exit 1
else
  echo "Command executed successfully with parameters: $@"
fi



##
# program title
echo "_________________________________________"
echo "AWS - Automatic Dummy Lambda Function"
echo "written by sebistj, 27/01/23"
echo "last update, 27/01/23"
echo "_________________________________________"

$PARAM_REGION =""
$PARAM_ROLE =""
$PARAM_NAME =""
$PARAM_RUNTIME =""

##
# usage print
echo  ""
echo "usage: $ bash project.sh {parameter0} {parameter1} {parameter2}"
echo "		Parameter 0 = region"
echo "		Sample regions: { "
echo "				- [Singapore] ap-southeast-2, "
echo "				- [Mumbai] ap-south-1 },"
echo "				}"

echo "		Parameter 1 = role name"

echo "		Parameter 2 = function name"

echo  "	Parameter 3 = runtime"
echo "		Sample runtimes: { "
echo "				- python3, "
echo "				- python2,"
echo "				- NodeJS,"
echo "				- neoNodeJS,"
echo "				- Java,"
echo "				}"

echo "end of usage ..."
echo ""


##
# init
echo ""
echo "configuring the AWS ..."

DEFAULT_REGION = "ap-southeast-1"
MUMBAI_REGION = "ap-south-1"
REGION="ap-southeast-1"






# if $PARAM_REGION is empty or null, then the region will be set to default else the param
if [[ -z "$PARAM_REGION" ]]; then
	# default region is set
	REGION=DEFAULT_REGION
	echo "REGION is set to: $REGION (by default)"
else
	# parameter region is set
	REGION=$PARAM_REGION
	echo "REGION is set to: $REGION (by PARAM)"
fi

echo "configuring the connection ..."

# Configure the AWS CLI to use the Singapore region
aws configure set default.region $REGION

# error checking for connection?

echo "configuring the connection ..."

default_role = "dummy_role"
rolename = "init_role"
# if $PARAM_ROLE is empty or null, then the role will be set to default else the param
if [[ -z "$PARAM_ROLE" ]]; then
        # default role is set
        rolename = default_role
        echo "REGION is set to: $REGION (by default)"
else
        # parameter rolename is set
        REGION=$PARAM_ROLE
        echo "REGION is set to: $REGION (by

echo "Creating role: $rolename"

defaultROLEPATH = "/role_folder/test-role-policy.json"


ROLE_PATH = "/role_folder/test-role-policy.json"


# AWS CLI command: create role
#aws iam create-role --role-name Test-Role --assume-role-policy-document file://test-role-policy.json
# aws iam create-role --role-name $PARAM_ROLE --asume-role-polic-document file://$ROLE_PATH

## aws iam create-role --role-name $PARAM_ROLE --asume-role-polic-document file://$ROLE_PATH

# example output as ARN:
# --role arn:aws:iam::123456789012:role/service-role/MyTestFunction-role-tges6bf4

outputARN + "abc"

echo "role has been created successfully: ARN: $outputARN"


# echo "role failed to be created"




echo "Writing rolename to variable to be used ..."

# sample ARN
# "Arn": "arn:aws:iam::354557032487:role/Test-Role",
#        "RoleId": "AROAVFDJ67ATUNTFHI6JE"
#


#role:
# --role arn:aws:iam::354557032487:role/Test-Role
# --role arn:aws:iam::354557032487:role/Test-Role


echo "creating lambda function"

# create lambda function 
# aws lambda create-function --function-name test_cli --runtime python3.6 --role new_test_cli_role --handler handler.lambda_handler --zip-file fileb://lambda.zip
# aws lambda create-function --function-name test_cli --runtime python3.6 --role arn:aws:iam::354557032487:role/Test-Role --handler handler.lambda_handler --zip-file fileb://lambda.zip
# aws lambda create-function --function-name $PARAM_NAME --runtime python3.6 --role arn:aws:iam::354557032487:role/Test-Role --handler handler.lambda_handler --zip-file fileb://lambda.zip


echo " chosen runtime & ARN"
echo  "runtime: $PARAM_RUNTIME"
echo  "role arn: $outputARN"
echo  "output arn: abc"



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

# singapore other ARN


echo "Attaching ARN layer to Lambda Function"

# attempt to attach arn layer to lambda function
# aws lambda create-event-source-mapping (ARN) (function-name) [(enabled?), (batch-size), (starting-position), (start-pos-timestamp), (cli-input-json), (skeleton) ]
# aws lambda create-event-source-mapping --event-source-arn arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1 --function-name test_cli --enabled



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
