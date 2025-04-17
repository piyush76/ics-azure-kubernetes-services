#!/bin/sh

set -e

NAMESPACE=$1
SECRET=$2

if [ -z ${NAMESPACE} ];
then
  echo "Namespace parameter is required.  Usage 'create-tcmis-db-secret.sh <namespace> <secret>'";
  exit 1
else
  echo "Creating 'tcmis-db-secret' secret for namespace ${NAMESPACE}";
fi

if [ -z ${SECRET} ];
then
  echo "Secret parameter is required. Usage 'create-tcmis-db-secret.sh <namespace> <secret>'";
  exit 1
fi

kubectl create secret generic tcmis-db-secret \
    --namespace ${NAMESPACE} \
    --from-literal=TCMIS_DB_SECRET=${SECRET}
