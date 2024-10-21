#!/bin/bash
set -e

echo "This script will create an S3 bucket in your AWS account"

read -p "Enter AWS region: " region
read -p "Enter S3 bucket name: " bucket_name
read -p "Enter AWS profile name (if not, type: \"default\"): " aws_profile

echo "Creating S3 bucket $bucket_name in $region..."
aws s3 mb s3://$bucket_name --region $region --profile $aws_profile
echo "S3 bucket $bucket_name created successfully in $region"

echo "Creating tags for S3 bucket $bucket_name..."
aws s3api put-bucket-tagging --bucket $bucket_name --tagging 'TagSet=[{Key=Project,Value=security-baseline},{Key=Environment,Value=prod},{Key=Compliance,Value=yes},{Key=IaCTool,Value=awscli},{Key=Usage,Value=event-driven},{Key=Sensitive,Value=no}]' --profile $aws_profile
echo "Tags created successfully for S3 bucket $bucket_name"