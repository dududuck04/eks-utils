#!/bin/bash

kubectl get deployments --all-namespaces -o json | jq '.items[] | {name: .metadata.name, namespace: .metadata.namespace, affinity: .spec.template.spec.affinity, tolerations: .spec.template.spec.tolerations}'

