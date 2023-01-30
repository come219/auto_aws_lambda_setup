import json

def lambda_handler(event, context):
    # TODO implement
#    print("Hello world AWS CLI")
#    print("event:", json.dumps(event))

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
