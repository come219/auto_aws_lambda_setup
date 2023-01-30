This is a README.md file for this code project : Automatic AWS Lambda Dummy Function Setup
written by sebistj, 25/01/23
last updated on, 27/01/23
version 1.0


# Automatic AWS Lambda Dummy Function Setup
# /auto_aws_lambda_setup

This project intends to, when invoked, automatically create an AWS Lambda function on the corresponding configured region.

Currently it has two invocation methods:


+ **auto_run.sh**	| This function features parameters when invoking the script, with multiple configurations. Error checking.


+ **auto_run_simple.sh**	| This function runs the functions without parameters or intervention. Parameters are set within the script.


### Prerequisites:

These are the prerequisites that are required inorder to invoke the script as the script uses them to preform the function.


+ **awscli**	| AWS command line use 
+ **python**	| python sdk
+ **python3**	| python3 sdk
+ **json**	| json sdk
+ **nodejs.14**	| nodejs 14 sdk
+ **nodejs.16** | nodejs 16 sdk
+  **nodejs.18** | nodejs 18 sdk
+ **java**	| java sdk
+ (outdated) **jq** - to replace json words
+  git		| git ??


### Commands:

This is a list of commands that are used within the project:


+ Initiate the automated script (simple version):

        $ bash auto_run_simple.sh 

        $ ./auto_run_simple 


+ Initiate the automated advanced script:

        $ bash auto_run.sh {param1} {param2}

        $ ./auto_run {param ...}

	
	Parameters: 
	
	+ param 0: Region configuration
	+ param 1: Function name
	+ param 2: Role name
	+ param 3: ...



### Codebase Files required:

This is a list files from the codebase that are required for the project to run properly. 

+ /dummy_codebase/	| This folder contains the different dummy lambda function codes
+ /role_folder/		| This folder contains the different role configuration files represented as json
+ /config_folder/	| Contains the data for configuring to the AWS account & region
+ /old_folder/		| This folder contains old codebase files & example files
+ /test_folder/ 	| This folder contains the different testing methods & techniques


### Files produced:

These files are produced as an output as a result for running/successfully executing the script.

+ function_output	| This file contains the lambda function creation execution output
+ arn_file		| This file contains the arn datas for the created lambda objects



## Change Log:
         ___________________________________________________
        | Version |     Date     |  Name         |  Comment
        |_________|______________|_______________|___________
        |   0.1   | ??/11-12/22  |  concieved    | init project
        |_________|______________|_______________|___________
        |   0.2   |    25/01/23  |  git init     | git init
        |_________|______________|_______________|___________
        |   1.0   |    27/01/23  |  project init | versioning
        |_________|______________|_______________|___________
        |   1.1   |  unreleased  |  m.v.p.       | working minimum viable product
        |_________|______________|_______________|__________


## Back Log:

        [✓] created this...
        [x] finished implementation
        [x] working advanced version
        [x] 30/01/23, uncommentted functions/features ... more documentation

