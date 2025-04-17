# Notes for Provisioning new ICS Kubernetes Cluster

## Create the ICS Namespaces

Use the `create-nonprod-namespace.sh` or `create-prod-namespaces.sh` script depending on which type of cluster is being provisioned.

## Create Secrets for Azure Container Registry

For all namespaces created, expcet for the `ics-devops` namespace, a secret must be added so that the ICS images in ACR can be pulled down into the cluster.

For each namespace except `ics-devops` run the `./create-acr-secret.sh` script.  The script takes two parameters: 'namespace name' and 'secret'.

The secret can be provided by the ICS Azure Container Registry admins (ICS DevOps team.)

## Deploy Harness Delegate

The Harness delegate(s) will need to be deployed in the cluster to execute deployment activities for the Harness CICD and Release pipelines.

If `cluster-admin` permissions can be granted to a Harness delegate, only one delegate is needed per cluster.  For the current non-production cluster, a single delegate with `cluster-admin` permissions is deployed in the `ics-devops` namespace.

The Kustomize manifests for the non-prod delegate can be found [here](../devops/harness/).

The production cluster delegates are TBD and the role requirements and permissions options for those delegates can be found [here](https://developer.harness.io/docs/platform/Delegates/advanced-installation/install-a-kubernetes-delegate#review-delegate-role-requirements).


