#!/usr/bin/env bash

NAMESPACE=$1
SECRET=$2

if [ -z ${NAMESPACE} ];
then
  echo "Namespace parameter is required.  Usage 'create-postgres-secrets.sh <namespace> <secret>'";
  exit 1
else
  echo "Creating 'postgres-password' secret for namespace ${NAMESPACE}";
fi

if [ -z ${SECRET} ];
then
  echo "Secret parameter is required. Usage 'create-posgres-secrets.sh <namespace> <secret>'";
  exit 1
fi

kubectl create secret generic postgres-password \
    --namespace ${NAMESPACE} \
    --from-literal=POSTGRES_PASSWORD=${SECRET}
