#!/bin/bash
#
cat > efs-claim.yaml <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: efs-claim
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: default-efs
  resources:
    requests:
      storage: 50Gi
EOF
