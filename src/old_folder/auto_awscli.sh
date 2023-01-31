

#create role
aws iam create-role --role-name Test-Role --assume-role-policy-document file://test-role-policy.json


#example:
# --role arn:aws:iam::123456789012:role/service-role/MyTestFunction-role-tges6bf4



# "Arn": "arn:aws:iam::354557032487:role/Test-Role",
#        "RoleId": "AROAVFDJ67ATUNTFHI6JE"
#


#role:
# --role arn:aws:iam::354557032487:role/Test-Role

# --role arn:aws:iam::354557032487:role/Test-Role


# create lambda function 
# aws lambda create-function --function-name test_cli --runtime python3.6 --role new_test_cli_role --handler handler.lambda_handler --zip-file fileb://lambda.zip
aws lambda create-function --function-name test_cli --runtime python3.6 --role arn:aws:iam::354557032487:role/Test-Role --handler handler.lambda_handler --zip-file fileb://lambda.zip



# layer arn:

# python & dynamodb
# arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1
#
# python & mysql
# arn:aws:lambda:ap-south-1:354557032487:layer:bangkok_petHotel:1
#
# nodejs14-16 
# arn:aws:lambda:ap-south-1:354557032487:layer:clientdynamodb:2

# attempt to attach arn layer to lambda function
# aws lambda create-event-source-mapping (ARN) (function-name) [(enabled?), (batch-size), (starting-position), (start-pos-timestamp), (cli-input-json), (skeleton) ]
# aws lambda create-event-source-mapping --event-source-arn arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1 --function-name test_cli --enabled

# aws lambda update-function-configuration --function-name my-function \
# --layers arn:aws:lambda:us-east-2:123456789012:layer:my-layer:3 \
# arn:aws:lambda:us-east-2:111122223333:layer:their-layer:2
# aws lambda update-function-configuration --function-name my-function  --layers arn:aws:lambda:us-east-2:123456789012:layer:my-layer:3
# aws lambda update-function-configuration --function-name test_cli --layers arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1


# to remove layers
# aws lambda update-function-configuration --function-name my-function --layers []


# --kms-key-arn


# aws lambda update-function-configuration --function-name test_cli --kms-key-arn arn:aws:lambda:ap-south-1:354557032487:layer:python-dynamodb:1
