#!/bin/bash

EKS_CLUSTER_NAME=cpx-me-prd
PROFILE_NAME=ccs-cpx-prd
ACCOUNT_ID=063803665340
REGION_ID=me-central-1
EKS_VERSION=1.29
EFS_ROLE_NAME=cpx-me-hkmc-prd-eks-add-efs-iamrol
##############################################
# 00 단계에서 나옴
OIDC_ID=072660B5F011B00F3BD5C2FE7D8EA651

# 12 단계에서 나옴
EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver
