#!/bin/bash

FILE_SYSTEM=fs-00df754933bad9cc7
# =========================================
cat > default-efs-sc.yaml <<EOF
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: default-efs
mountOptions:
- iam
parameters:
  directoryPerms: "700"
  fileSystemId: ${FILE_SYSTEM}
  provisioningMode: efs-ap
provisioner: efs.csi.aws.com
reclaimPolicy: Retain
volumeBindingMode: Immediate
allowVolumeExpansion: true
EOF