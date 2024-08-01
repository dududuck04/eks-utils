#!/bin/bash
#
. ./env.sh
aws iam create-role \
  --role-name ${EFS_ROLE_NAME} \
  --assume-role-policy-document file://"aws-efs-csi-driver-trust-policy.json" \
  --profile ${PROFILE_NAME}