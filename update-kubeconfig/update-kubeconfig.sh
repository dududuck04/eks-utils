#!/bin/bash

aws eks update-kubeconfig \
	--name dkc2-au-hmc-prd \
	--region ap-southeast-1 \
	--alias "PRD:dkc2-au-hmc-prd:084375580507" \
	--profile prd