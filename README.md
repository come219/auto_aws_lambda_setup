This is a README.md file for this code project : Automatic AWS Lambda Dummy Function Setup
written by sebistj, 25/01/23
last updated on, 27/01/23


# Automatic AWS Lambda Dummy Function Setup
# /auto_aws_lambda_setup

This project intends to, when invoked, automatically create an AWS Lambda function on the corresponding configured region.
Currently it has two invocation methods:
	- auto_run.sh	| This function features parameters when invoking the script, with multiple configurations. Error checking.
	- auto_run_simple.sh	| This function runs the functions without parameters or intervention. Parameters are set within the script.

### Prereq:

awscli -> AWS command line use 

jq - to replace json words

python - python
python3 - python

json - 

nodejs - nodejs



Commands:

initiate the automated script:

$ bash function.sh {param1} {param2}

$ ./function.sh {param ...}



param 0: Region configuration
param 1: Function name
param 2: Role name
param 3: ...



Files required:

/dummy_codebase


Files produced:
function_output
