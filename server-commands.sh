#!/bin/bash

docker-compose -f docker-compose.yaml up -d 
echo "App successfully deployed"

# creating kubernetes clusters using keps
# kops create cluster  --name=kubevpro.isdevopsproject.com --state=s3://isreal-kops-state --zones=us-east-1a,us-east-1b --node-count=2 --node-size=t3.small --master-size=t3.medium --dns-zone=kubevpro.isdevopsproject.com --node-volume-size=8 --master-volume-size=8

# kops update cluster --name kubevpro.isdevopsproject.com --state=s3://isreal-kops-state  --yes --admin
