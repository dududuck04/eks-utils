#!/bin/bash

EFS_ROLE_NAME=ccs2-me-hmc-prd-add-efs-role
EKS_CLUSTER_NAME=ccs2-me-hmc-prd
PROFILE_NAME=hae-ccs-prd
ACCOUNT_ID=063803665340
REGION_ID=me-central-1
EKS_VERSION=1.29
##############################################
# 00 단계에서 나옴
OIDC_ID=

# 12 단계에서 나옴
EFS_VERSION=

#=============================================
ADDON_NAME=aws-efs-csi-driver