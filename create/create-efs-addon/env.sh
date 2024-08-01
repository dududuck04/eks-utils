#!/bin/bash

EKS_CLUSTER_NAME=ccs2-br-hmc-prd
PROFILE_NAME=ccs2-br-hmc-prd
ACCOUNT_ID=058264527303
REGION_ID=sa-east-1
EKS_VERSION=1.30
EFS_ROLE_NAME=ccs2-br-hmc-prd-eks-add-efs-iamrol

##############################################
# 00 단계에서 나옴
OIDC_ID=E6C7F5BE108EF13335EC1E996B1D29CA

# 12 단계에서 나옴
EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver