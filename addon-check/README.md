## addon-check 디렉토리

해당 디렉토리 내 스크립트는 Helm 차트가 아니라 AWS에서 직접 관리하는 EKS addon들의 버전 정보를 조회합니다.

환경변수에 정의된 EKS_VERSION에 맞는 addon 버전 목록 값을 얻을 수 있습니다.

### 사용 방법
- aws cli 사용 권한 설정
- `env.sh` 스크립트로 `EKS_VERSION` 환경 변수 설정 / 동일 경로
