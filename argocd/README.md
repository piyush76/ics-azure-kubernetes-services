# ArgoCD Deployment

This directory contains ArgoCD application manifests for deploying services to Azure Kubernetes Services.

## Prerequisites

1. ArgoCD installed on your Azure Kubernetes cluster
2. Access to the Azure Kubernetes cluster
3. Git repository access

## Setup ArgoCD

If you haven't installed ArgoCD yet, you can install it using:

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Deploying Applications

To deploy all applications using ArgoCD:

1. Apply the application manifests:

```bash
kubectl apply -f argocd/applications/
```

2. Check the status of your applications:

```bash
kubectl get applications -n argocd
```

3. Access the ArgoCD UI:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Then open your browser at https://localhost:8080

## Environment-specific Deployments

The application manifests are configured to use the `dev` overlay by default. To deploy to other environments:

1. Edit the application manifest to point to the desired overlay (e.g., `stg`, `intg`, `prod`)
2. Apply the updated manifest

## Syncing Applications

ArgoCD will automatically sync applications based on the configuration in the manifests. You can also manually sync applications from the ArgoCD UI or using the CLI:

```bash
argocd app sync <application-name>
```

## Troubleshooting

If you encounter issues with the deployments:

1. Check the ArgoCD application status:
   ```bash
   kubectl describe application <application-name> -n argocd
   ```

2. Check the ArgoCD logs:
   ```bash
   kubectl logs -n argocd -l app.kubernetes.io/name=argocd-server
   ```
