# ics-azure-kubernetes-services

This repository contains Kubernetes manifests for Azure Kubernetes Services.

## Deployment Options

### Manual Deployment

You can deploy the services manually using `kubectl apply` commands for each manifest.

### ArgoCD Deployment (Recommended)

This repository supports GitOps-based deployments using ArgoCD. See the [ArgoCD README](./argocd/README.md) for detailed instructions.

## Repository Structure

- `argocd/`: ArgoCD application manifests and documentation
- `cluster/`: Scripts for cluster setup and namespace creation
- `devops/`: DevOps tools and configurations
- `docs/`: Documentation and architecture decision records
- `ics-demo-app/`: Kubernetes manifests for the demo application
- `ics-operations-app/`: Kubernetes manifests for the operations application
- `ics-service/`: Kubernetes manifests for the main service
- `ics-service-template/`: Template for creating new services
- `infra/`: Infrastructure components like PostgreSQL
