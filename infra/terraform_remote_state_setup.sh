#!/usr/bin/env bash

# Assume that the AWS environment variables have been setup correctly. We create
# the S3 bucket required for storing the terraform remote state.

set -e

# Disable pager for AWS CLI
PAGER='cat'
export PAGER

# Terraform remote state variables
REMOTE_STATE_S3='reonic-remote-state'
DYNAMODB_TABLE="${REMOTE_STATE_S3}-lock"
REGION='us-east-1'

set -x

# Create the S3 bucket for terraform state
aws s3api create-bucket \
    --bucket "${REMOTE_STATE_S3}" \
    --region "${REGION}"

# Enable versioning on the S3 bucket
aws s3api put-bucket-versioning \
    --bucket "${REMOTE_STATE_S3}" \
    --versioning-configuration Status=Enabled

# Enable encryption
aws s3api put-bucket-encryption \
    --bucket "${REMOTE_STATE_S3}" \
    --region "${REGION}" \
    --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# TODO Enable specific service account to access the S3 bucket

# Create dynamodb used for locking the remote state
aws dynamodb create-table \
    --table-name "${DYNAMODB_TABLE}" \
    --region "${REGION}" \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput \
    ReadCapacityUnits=5,WriteCapacityUnits=5

set +x
