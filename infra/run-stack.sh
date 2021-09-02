
#!/bin/bash 
set -eu

# template validation
aws cloudformation validate-template --template-body file://"$(pwd)"/production/vpc.yml
aws cloudformation validate-template --template-body file://"$(pwd)"/production/ec2.yml
aws cloudformation validate-template --template-body file://"$(pwd)"/production/rds.yml

# deploy
aws cloudformation create-stack --stack-name Bookers2VPCStack --template-body file://"$(pwd)"/production/vpc.yml

aws cloudformation wait stack-create-complete --stack-name Bookers2VPCStack
aws cloudformation create-stack --stack-name Bookers2EC2Stack --template-body file://"$(pwd)"/production/ec2.yml

aws cloudformation wait stack-create-complete --stack-name Bookers2EC2Stack
aws cloudformation create-stack --stack-name BookersRDSStack --template-body file://"$(pwd)"/production/rds.yml