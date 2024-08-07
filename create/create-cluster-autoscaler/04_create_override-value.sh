#!/bin/bash
#
. ./env.sh

cat >override-value.yaml<<EOF
autoDiscovery:
  clusterName: ${EKS_CLUSTER_NAME}

awsRegion: ${REGION_ID}
replicaCount: 1

image:
  repository: ${ACCOUNT_ID}.dkr.ecr.${REGION_ID}.amazonaws.com/eks/cluster-autoscaler
  tag: v1.30.0

serviceMonitor:
  enabled: false
  interval: 15s
  path: /metrics
  namespace: ${NAMESPACE_NAME}

resources:
  requests:
    cpu: "100m"
    memory: "100Mi"
  limits:
    cpu: "100m"
    memory: "100Mi"

rbac:
  create: true
  pspEnabled: false
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::${ACCOUNT_ID}:role/${ROLE_NAME}
    create: true
    name: ${SERVICE_ACCOUNT_NAME}
    automountServiceAccountToken: true

extraArgs:
  logtostderr: true
  stderrthreshold: info
  v: 4
  # write-status-configmap: true
  # leader-elect: true
  skip-nodes-with-local-storage: false
  expander: least-waste
  # scale-down-enabled: true
  balance-similar-node-groups: true
  # min-replica-count: 0
  # scale-down-utilization-threshold: 0.5
  # scale-down-non-empty-candidates-count: 30
  # max-node-provision-time: 15m0s
  # scan-interval: 10s
  # scale-down-delay-after-add: 10m
  # scale-down-delay-after-delete: 0s
  # scale-down-delay-after-failure: 3m
  # scale-down-unneeded-time: 10m
  skip-nodes-with-system-pods: false

extraVolumes:
  - name: ssl-certs
    hostPath:
      path: /etc/ssl/certs/ca-bundle.crt

extraVolumeMounts:
  - name: ssl-certs
    mountPath: /etc/ssl/certs/ca-certificates.crt
    readOnly: true

fullnameOverride: aws-cluster-autoscaler

containerSecurityContext:
  capabilities:
    drop:
    - ALL

securityContext:
  runAsNonRoot: true
  runAsUser: 1001
  runAsGroup: 1001

# podDisruptionBudget -- Pod disruption budget.
podDisruptionBudget:
  maxUnavailable: 1
  # minAvailable: 2
EOF  

helm upgrade --install cluster-autoscaler/cluster-autoscaler \
  --version 9.37.0 \
  --untar