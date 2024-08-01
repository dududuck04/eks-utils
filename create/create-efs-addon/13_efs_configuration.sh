#!/bin/bash
#
. env.sh

aws eks describe-addon-configuration \
    --addon-name ${ADDON_NAME} \
    --addon-version ${EFS_VERSION} \
    --profile ${PROFILE_NAME} \
    --region ${REGION_ID}