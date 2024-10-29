#!/bin/bash

EKS_CLUSTER_NAME=
PROFILE_NAME=
REGION_ID=
PROJECT_NAME=cluster-autoscaler
NAMESPACE_NAME=kube-system
ACCOUNT_ID=

ROLE_NAME=
POLICY_NAME=

##############################################
SERVICE_ACCOUNT_NAME=${PROJECT_NAME}-sa
OIDC_ID=

EFS_VERSION=v2.0.5-eksbuild.1

#=============================================
ADDON_NAME=aws-efs-csi-driver