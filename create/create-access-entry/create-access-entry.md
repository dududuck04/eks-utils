# 기본 환경 변수 설정
```
AWS_REPO_ACCOUNT=
EKS_NAME=
```
# 계정 정보 수집
```
aws iam list-users --query 'Users[*].UserName' --output text | grep "@m"
```

## 사용자 정보
```

```
# eks api enable
```
echo ${EKS_NAME}
aws eks update-cluster-config --name ${EKS_NAME} --access-config authenticationMode=API_AND_CONFIG_MAP
```

# function 등록
```
function register_access_entry {
    USER_NAME=$1
    EMAIL_ADDRESS=$2
    POLICY_TYPE=$3
	aws eks create-access-entry \
        --cluster-name ${EKS_NAME} \
        --principal-arn arn:aws:iam::${AWS_REPO_ACCOUNT}:user/${EMAIL_ADDRESS} \
        --type STANDARD \
        --username "mzc.${USER_NAME}"

	aws eks associate-access-policy \
        --cluster-name ${EKS_NAME} \
        --principal-arn arn:aws:iam::${AWS_REPO_ACCOUNT}:user/${EMAIL_ADDRESS} \
        --access-scope type=cluster \
        --policy-arn arn:aws:eks::aws:cluster-access-policy/${POLICY_TYPE}
}
```