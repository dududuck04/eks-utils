#!/bin/bash
#
. ./env.sh

aws eks describe-addon-versions --kubernetes-version ${EKS_VERSION} --addon-name ${ADDON_NAME} \
    --query 'addons[].addonVersions[].{Version: addonVersion, Defaultversion: compatibilities[0].defaultVersion}' --output table \
    --profile ${PROFILE_NAME}

echo "env.sh 에 EFS_VERSION 값 설정 필요 !!!"