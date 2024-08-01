#!/bin/bash

kubectl get cm aws-auth -o yaml -n kube-system | kubectl neat | tee aws-auth-$(date '+%Y%m%d%H%M%S').yaml