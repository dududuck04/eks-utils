#!/bin/bash
AWS_REPO_ACCOUNT=539666729110
AWS_REGION=ap-northeast-1
AWS_ECR_REPO_NAME=praqma/network-multitool

kubectl run -it --image=$AWS_REPO_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/${AWS_ECR_REPO_NAME}:latest network-multitool --restart=Never -- bash