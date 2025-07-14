import json

def lambda_handler(event, context):
    """
    Hello, World! lambda function
    """

    print("Hello from Lambda!")
    print(f"Received event: {json.dumps(event, indent=2)}")

    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps('Hello, World from AWS Lambda!')
    }
