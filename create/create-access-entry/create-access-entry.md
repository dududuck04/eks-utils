# 기본 환경 변수 설정
```
AWS_REPO_ACCOUNT=084375580507
EKS_NAME=dkc2-au-gns-prd
```
# 계정 정보 수집
```
aws iam list-users --query 'Users[*].UserName' --output text | grep "@m"
```

## 사용자 정보
```
고길영 매니저님 : gyko@mz.co.kr
조효빈 매니저님 : hbcho@mz.co.kr
서현철 : hcseo@mz.co.kr
서현철 : hcseo@megazone.com
이태훈 : leeth@megazone.com
박소이 : soyip@megazone.com
차원호 : wcha@megazone.com

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

# User 등록
```
- 서현철
register_access_entry hcseo hcseo@mz.co.kr AmazonEKSClusterAdminPolicy
register_access_entry hcseo hcseo@megazone.com AmazonEKSClusterAdminPolicy

register_access_entry yulisys yulisys@megazone.com AmazonEKSClusterAdminPolicy
register_access_entry sakar sakar@megazone.com AmazonEKSAdminViewPolicy
register_access_entry hms hms@megazone.com AmazonEKSAdminViewPolicy

register_access_entry gyko gyko@mz.co.kr AmazonEKSAdminViewPolicy
register_access_entry hbcho hbcho@mz.co.kr AmazonEKSAdminViewPolicy

- 박소이
register_access_entry soyip soyip@megazone.com AmazonEKSClusterAdminPolicy

- 이태훈
register_access_entry leeth leeth@megazone.com AmazonEKSAdminViewPolicy

- 차원호
register_access_entry wcha wcha@megazone.com AmazonEKSAdminViewPolicy
```