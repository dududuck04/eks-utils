#!/bin/bash
#
. ./env.sh
aws iam create-role \
  --role-name ${ROLE_NAME} \
  --assume-role-policy-document file://"aws-${PROJECT_NAME}-trust-policy.json" \
  --profile ${PROFILE_NAME}