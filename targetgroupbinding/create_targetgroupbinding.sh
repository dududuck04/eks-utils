#!/bin/bash

. ./env.sh

if [ "$#" != 5 ];then
  echo "Usage: ./create_targetgroupbinding.sh [name] [namespace] [svc] [port] [targetgrouparn]"
  exit 1;
fi
TARGET_GROUP_NAME=$1
NAMESPACE=$2
SERVICE_NAME=$3
PORT_NAME=$4
TARGET_GROUP_ARN=$5

# aws elbv2 describe-target-groups --names  ccs2-br-hmc-igw-pub-nlb-tg30010 --profile ccs2-br-hmc-prd --region sa-east-1 --output json

cat <<EOF  > ${TARGET_GROUP_NAME}.yml
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: ${TARGET_GROUP_NAME}
  namespace: ${NAMESPACE}
spec:
  serviceRef:
    name: ${SERVICE_NAME}
    port: ${PORT_NAME}
  targetGroupARN: ${TARGET_GROUP_ARN}
EOF

#kubectl ns ${NAMESPACE}
#kubectl apply -f ${TARGET_GROUP_NAME}.yml

#k get TargetGroupBinding | grep ${${TARGET_GROUP_NAME}}