#!/usr/bin/env bash

NAMESPACE=$1
SECRET=$2

if [ -z ${NAMESPACE} ];
then
  echo "Namespace parameter is required.  Usage 'create-acr-secret.sh <namespace> <secret>'";
  exit 1
else
  echo "Creating ACR secret for namespace ${NAMESPACE}";
fi

if [ -z ${SECRET} ];
then
  echo "Secret parameter is required. Usage 'create-acr-secret.sh <namespace> <secret>'";
  exit 1
fi

kubectl create secret docker-registry acr-secret \
    --namespace ${NAMESPACE} \
    --docker-server=incora.azurecr.io \
    --docker-username=980c0b8d-f53e-459f-b39c-8f2b43641cad \
    --docker-password=${SECRET}
