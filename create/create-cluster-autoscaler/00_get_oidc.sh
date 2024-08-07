#!/bin/bash
#
#
. ./env.sh

aws eks describe-cluster --name ${EKS_CLUSTER_NAME} \
    --query "cluster.identity.oidc.issuer" \
    --output text \
    --profile ${PROFILE_NAME} \
    --region ${REGION_ID}

echo "oidc 값 env.sh 에 세팅 필요 !!"