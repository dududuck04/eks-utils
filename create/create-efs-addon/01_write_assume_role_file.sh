#!/bin/bash
#
. ./env.sh

cat >aws-efs-csi-driver-trust-policy.json<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::${ACCOUNT_ID}:oidc-provider/oidc.eks.${REGION_ID}.amazonaws.com/id/${OIDC_ID}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringLike": {
          "oidc.eks.${REGION_ID}.amazonaws.com/id/${OIDC_ID}:sub": "system:serviceaccount:kube-system:efs-csi-*",
          "oidc.eks.${REGION_ID}.amazonaws.com/id/${OIDC_ID}:aud": "sts.amazonaws.com"
        }
      }
    }
  ]
}
EOF

cat aws-efs-csi-driver-trust-policy.json