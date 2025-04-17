# Harness Kustomize Manifests

## Non-Production Delegate

The non-production ICS cluster will deploy a single Harness delegate with `cluster-admin` role permissions.  With those permissions a single delegate will be operating in all three non-production ICS environments (or namespaces - ics-dev, ics-intg, ics-stage).

There are two manifests for the Harness Delegate.  `./base/secret.yaml` is a template to create the access token secret for the delegate.  If re-deploying the delegate, get the real access token from the DevOps team and run `kubectl apply -f ./base/secret.yaml --namespace ics-devops`.

The remaining manifest is a Kustomize overlay found under `./overlays/non-prod` was used to deploy the remaining assets for the ICS non-production delegate.

## Production Delegate

The production delegate can be deployed with the same `cluster-admin` permissions as the non-production delegate or one delegate per namespace could be used and the delegate only granted namespace specific access.

See the [Harness docs](https://developer.harness.io/docs/platform/Delegates/advanced-installation/install-a-kubernetes-delegate#review-delegate-role-requirements) for more information.

## OpenShift Security Context Constraint Notes

How to tell what SCC a Pod is running under:

`kubectl get pod <pod name> -o yaml | grep scc`  

Get SCC for all pods in a namespace:

`kubectl get pods --output=custom-columns='NAME:.metadata.name,SCC:.metadata.annotations.openshift\.io/scc'`

How 