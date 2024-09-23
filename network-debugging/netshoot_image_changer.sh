#!/bin/bash
AWS_REPO_ACCOUNT=539666729110
AWS_REPO_PROFILE=cnp-key
AWS_REGION=ap-northeast-1
AWS_ECR_REPO_NAME=nicolaka/netshoot

img_repo_change() {
  REPO_FULLPATH=$1
  IMG_TAG=$2
  ORIGIN_IMG=$REPO_FULLPATH:$IMG_TAG
  # OLD_AWS_ECR_REPO_NAME=$(echo $ORIGIN_IMG | cut -d '/' -f2- | cut -d ':' -f1)
  PRIVATE_ECR=$AWS_REPO_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com
  PRIVATE_ECR_IMG=$PRIVATE_ECR/$AWS_ECR_REPO_NAME:$IMG_TAG

  echo $REPO_NAME
  echo $IMG_TAG
  echo $PRIVATE_ECR

  # Iamge Pull
  echo "Origin Image Pull
  docker pull "$ORIGIN_IMG"
  "
  docker pull $ORIGIN_IMG

  # ECR Login
  echo "
  # Docker Login
  aws --profile $AWS_REPO_PROFILE ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $PRIVATE_ECR
  "
  aws --profile $AWS_REPO_PROFILE ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $PRIVATE_ECR

  # Image Tag Change
  docker tag $ORIGIN_IMG $PRIVATE_ECR_IMG

  # Image Push
  docker push $PRIVATE_ECR_IMG

  # Image Remove
  docker rmi $PRIVATE_ECR_IMG $ORIGIN_IMG
}

upload_netshoot() {
  IMG_TAG=$1
  img_repo_change nicolaka/netshoot $IMG_TAG
}

# IMG Version
upload_netshoot v0.13