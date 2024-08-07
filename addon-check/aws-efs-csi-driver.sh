#!/bin/bash

. ./env.sh
# ==================================================================
ADDON_NAME=aws-efs-csi-driver

aws eks describe-addon-versions --kubernetes-version ${EKS_VERSION} \
    --addon-name ${ADDON_NAME} \
    --query 'addons[].addonVersions[].{Version: addonVersion, Defaultversion: compatibilities[0].defaultVersion}' \
    --region ${REGION_NAME} \
    --output table