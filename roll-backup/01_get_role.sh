#!/bin/bash

ROLL_NAME=shp-dev-eks-alb-add-rol
#============================================================================
aws iam get-role --role-name ${ROLL_NAME} --output json | tee role_backup.json

#============================================================================
# 2. 인라인 정책 목록 백업
aws iam list-role-policies --role-name "$ROLE_NAME" --output json | tee "${ROLE_NAME}_inline_policies.json"

# 2-1. 각 인라인 정책의 내용 백업
POLICIES=$(aws iam list-role-policies --role-name "$ROLE_NAME" --query 'PolicyNames' --output text)
for policy in $POLICIES; do
    aws iam get-role-policy --role-name "$ROLE_NAME" --policy-name "$policy" --output json | tee "${ROLE_NAME}_${policy}_inline_policy.json"
done

# 3. 관리형 정책 목록 백업
aws iam list-attached-role-policies --role-name "$ROLE_NAME" --output json | tee "${ROLE_NAME}_managed_policies.json"