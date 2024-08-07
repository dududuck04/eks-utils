#!/bin/bash

. ./env.sh
# ==================================================================
ADDON_NAME=vpc-cni

aws eks describe-addon-versions --kubernetes-version ${EKS_VERSION} \
    --addon-name ${ADDON_NAME} \
    --query 'addons[].addonVersions[].{Version: addonVersion, Defaultversion: compatibilities[0].defaultVersion}' \
    --region ${REGION_NAME} \
    --output table

# aws eks describe-addon-configuration --addon-name vpc-cni --addon-version v1.18.1-eksbuild.3 --query 'configurationSchema' --output json | jq -r '.' | python3 -m json.tool
    