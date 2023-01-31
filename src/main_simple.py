import boto3
import json

##
# program title
print("_________________________________________")
print("AWS - Automatic [SIMPLIFIED] Dummy Lambda Function")
print("written by sebistj, 27/01/23")
print("last update, 30/01/23")
print("_________________________________________")

# dynamic params
PARAM_REGION = "ap-southeast-1"
PARAM_ROLE = "dummy_role1"
PARAM_NAME = "dummy_function1"
PARAM_RUNTIME = "nodejs16.x"

# sample params
PARAM_RUNTIME1 = "nodejs"
PARAM_RUNTIME2 = "nodejs14.x"
PARAM_RUNTIME3 = "nodejs16.x"
DEFAULT_REGION = "ap-southeast-1"
MUMBAI_REGION = "ap-south-1"

##
# init
print("")
print("configuring the AWS ...")
print("")

##
# Configure the AWS CLI to use the region
#
session = boto3.session.Session(region_name=PARAM_REGION)
print("configuring the connection ...")
print("REGION is set to:", PARAM_REGION)

##
# AWS CLI command: create role
#
ROLE_PATH = "role_folder/test-role-policy.json"

print("Creating role:", PARAM_ROLE)
print("using role path:", ROLE_PATH)

iam = session.client("iam")
response = iam.create_role(
    RoleName=PARAM_ROLE,
    AssumeRolePolicyDocument=json.dumps({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    })
)

role_arn = response["Role"]["Arn"]
print("role has been created successfully and ARN is", role_arn)

##
# Create a Lambda function
#
lambda_client = session.client("lambda")
response = lambda_client.create_function(
    FunctionName=PARAM_NAME,
    Runtime=PARAM_RUNTIME,
    Role=role_arn,
    Handler="index.handler",
    Code={
        "ZipFile": b"<Add your code here>",
    },
)

print("Lambda function created successfully")
