#!/bin/bash

EKS_CLUSTER_NAME=
PROFILE_NAME=
ACCOUNT_ID=
REGION_ID=
EKS_VERSION=1.29
EFS_ROLE_NAME=
##############################################
# 00 단계에서 나옴
OIDC_ID=

# 12 단계에서 나옴
EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver
