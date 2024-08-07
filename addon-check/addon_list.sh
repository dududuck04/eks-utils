#!/bin/bash
. ./env.sh

aws eks describe-addon-versions --kubernetes-version ${EKS_VERSION} \
    --query 'addons[].{MarketplaceProductUrl: marketplaceInformation.productUrl, Name: addonName, Owner: owner Publisher: publisher, Type: type}' \
    --output table