#!/bin/bash

EKS_CLUSTER_NAME=ccs2-br-hmc-prd
PROFILE_NAME=ccs2-br-hmc-prd
REGION_ID=sa-east-1
PROJECT_NAME=cluster-autoscaler
NAMESPACE_NAME=kube-system
ACCOUNT_ID=058264527303

ROLE_NAME=ccs2-br-hmc-prd-eks-add-${PROJECT_NAME}-iamrol
POLICY_NAME=ccs2-br-hmc-prd-eks-add-${PROJECT_NAME}-iampol

##############################################
# 00 단계에서 나옴
SERVICE_ACCOUNT_NAME=${PROJECT_NAME}-sa
OIDC_ID=E6C7F5BE108EF13335EC1E996B1D29CA

# 12 단계에서 나옴
EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver