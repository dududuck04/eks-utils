#!/bin/bash
STORAGECLASS_NAME=default-efs
FILESYSTEM_ID=fs-
#============================================
cat >storageclass.yaml<<EOF
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ${STORAGECLASS_NAME}
provisioner: efs.csi.aws.com
reclaimPolicy: Retain
volumeBindingMode: Immediate
allowVolumeExpansion: true
mountOptions:
  - iam
parameters:
  directoryPerms: "700"
  fileSystemId: ${FILESYSTEM_ID}
  provisioningMode: efs-ap
EOF