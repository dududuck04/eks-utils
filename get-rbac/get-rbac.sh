#!/bin/bash

[ -f "aws-auth.yaml" ] && rm -rf aws-auth.yaml && echo "delete success"

kubectl get configmap aws-auth -n kube-system -o yaml > aws-auth.yaml

echo "groups|rolearn|rolename" | tee "rbac.csv"
yq eval '.data.mapRoles' aws-auth.yaml | yq '.[] | [.groups | join(", "), .rolearn, .username] | join("|")' | tee -a "rbac.csv"

echo "groups|userarn|username" | tee -a "rbac.csv"
yq eval '.data.mapUsers' aws-auth.yaml | yq '.[] | [.groups | join(", "), .userarn, .username] | join("|")' | tee -a "rbac.csv"