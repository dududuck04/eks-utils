#!/bin/bash
#
. ./env.sh

aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy \
  --role-name ${EFS_ROLE_NAME} \
  --profile ${PROFILE_NAME}