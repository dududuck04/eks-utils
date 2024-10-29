## AWS-load-balancer-controller

### Affinity
특정 노드 또는 노드 그룹에 파드가 스케줄되도록 할 수 있습니다. 미리 노드에 라벨을 구성하여 그 라벨을 기준으로 파드 스케줄링 규칙을 정의할 수 있습니다.

현재 커스텀 예시 value 파일에서는 sample-az1 , sample-az2 이 붙은 노드에 Pod 를 배치하도록 구성되어있습니다.

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
            - key: "kubernetes.io/sample-az-name"
              operator: "In"
              values:
                - "sample-az1"
                - "sample-az2"
```

### Tolerations
Tolerations은 Kubernetes에서 노드가 특정 taints를 갖고 있을 때도 그 노드에 파드를 스케줄할 수 있게 해주는 설정입니다.

taints와 tolerations은 함께 작동하여 파드가 어떤 노드에 배치될 수 있는지를 제어합니다.

아래 설정은 노드가 일시적으로 네트워크 문제로 인해 도달할 수 없게 되었을 때, 중요한 파드가 계속해서 해당 노드에서 작동할 수 있도록 유지하는데 유용합니다.

```yaml
tolerations:
  - key: "node.kubernetes.io/unreachable"  // taint의 키
    operator: "Exists"  // 
    effect: "NoExecute"  // taint가 파드에 미치는 영향을 지정한다.
    tolerationSeconds: 6000
```

