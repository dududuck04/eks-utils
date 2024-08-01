#!/bin/bash

. ./env.sh

aws eks create-addon \
    --cluster-name ${EKS_CLUSTER_NAME} \
    --addon-name ${ADDON_NAME} \
    --addon-version ${EFS_VERSION} \
    --service-account-role-arn arn:aws:iam::${ACCOUNT_ID}:role/${EFS_ROLE_NAME} \
    --resolve-conflicts PRESERVE \
    --profile ${PROFILE_NAME} \
    --region ${REGION_ID}