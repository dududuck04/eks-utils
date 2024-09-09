#!/bin/bash

EKS_CLUSTER_NAME=cpx-me-stg
PROFILE_NAME=ccs-cpx-stg
ACCOUNT_ID=622875144759
REGION_ID=me-central-1
EKS_VERSION=1.29
EFS_ROLE_NAME=cpx-me-hkmc-stg-eks-add-efs-iamrol
##############################################
# 00 단계에서 나옴
OIDC_ID=1DF087609A3F2DE9650CA1CB98A49B5B

# 12 단계에서 나옴
EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver
