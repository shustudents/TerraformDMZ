import boto3
from botocore.exceptions import ClientError
import json
import argparse
import os
import sys

# Define CLI Arguments

parser = argparse.ArgumentParser(description='Pass in Parameters for Backend Configuration')
parser.add_argument('--bucket-name', metavar='B', type=str, help='The name of your S3 Bucket for remote state', required=True)
parser.add_argument('--table-name', metavar='T', type=str, help='The name of your DynamoDB Table for Locking', required=True)
parser.add_argument('--region', metavar='R', type=str, help='The AWS Region where youd like resources to be created', required=True)
parser.add_argument('--profile', metavar='P', type=str, help='The AWS profile to use for resources to be created', required=False)
args = parser.parse_args()

# Declare Global Variables

bucket = args.bucket_name

table = args.table_name

region = args.region

profile = args.profile

os.environ['AWS_DEFAULT_REGION'] = region

# Display to User for verbosity

print "You've passed in the following parameters: " + "Bucket: " + bucket + " DynamoDB Table: " + table + " Region: " + region + " Profile: " + profile

raw_input("Press Enter to Continue...")

def create_s3_bucket(bucket, region):
    """Check/Create S3 Bucket"""
    session = boto3.Session(profile_name=profile)
    client = session.client('s3')
    print "Checking If Bucket Already Exists...."
    try:
        exists = client.head_bucket(Bucket=bucket)
        if exists['ResponseMetadata']['HTTPStatusCode'] == 200:
            print "Bucket Already Exists. Re-try again with different bucket-name"
            print "Skipping to DynamoDB Table Creation"
        create_dynamo_table(table, region)
    except ClientError as e:
        if e.response['ResponseMetadata']['HTTPStatusCode'] == 404:
            print "Bucket Name is Available"
        else:
            raise
        if region != 'us-east-1':
            creation = client.create_bucket(ACL='private',Bucket=bucket, CreateBucketConfiguration={'LocationConstraint': region})
            print "Successfully Created S3 Bucket within region: " + region
        else:
            creation = client.create_bucket(ACL='private',Bucket=bucket)
            print "Successfully Created S3 Bucket within region: " + region

def create_dynamo_table(table, region):
    """Create/Check DynamoDB Table"""
    client = boto3.client('dynamodb')
    print "Checking if DynamoDB Table Already Exists..."
    try:
        response = client.describe_table(TableName=table)
    except ClientError as e:
        if e.response['Error']['Code'] == "ResourceNotFoundException":
            print "DynamoDB Table Doesn't Exist. Creating..."
            response = client.create_table(
                AttributeDefinitions=[
                    {
                    'AttributeName': 'LockID',
                    'AttributeType': 'S'
                    },
                    ],
                KeySchema=[
                    {'AttributeName': 'LockID',
                     'KeyType': 'HASH'
                    }
                    ],
                ProvisionedThroughput={
                    'ReadCapacityUnits': 20,
                    'WriteCapacityUnits': 20
                    },
                TableName=table
                )
        else:
            print e

def main():
    """Primary Entry Point"""
    create_s3_bucket(bucket,region)
    create_dynamo_table(table,region)

if __name__ == "__main__":
    main()
