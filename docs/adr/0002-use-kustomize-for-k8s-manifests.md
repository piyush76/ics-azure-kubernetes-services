# 2. Use Kustomize for K8S Manifests

Date: 2022-10-13

## Status

Accepted

## Context

Kubernetes manifests need tooling for manual and automated deployments and setup.  For each ICS application and service, we will need a Kubernetes manifest with runtime configuration specific to the different environments the app or service is deployed.

Managing the base or common manifest and the environment specific configuration is done many ways but the top three are:

   * Using fully formed manifests for each resource and configuration combination.  This duplicates the shared or common base definition.  Is difficult to see which attributes are shared or common and which are overrides.
   * Use Helm Charts.  Helm is a package management system that provides manifest management plus templating engine for runtime overrides.  Requires runtime services inside Kubernetes and also is opinionated about deployment mechanisms.
   * Kustomize - tool built into Kubectl for defining base manifests and override patches.  Designed for just this concern and does not require any runtime services or CLI tooling.  Can be considered "part" of Kubernetes.

Any solution to this concern must also interoperate well with the Harness.io platform which will be used for our ICS deployment automation and orchestration.

All manifests and configuration will be stored in Git repos so any solution to this concern must work well with the files system and Git.

## Decision

Use Kustomize to manage our Kubernetes manifests.

Kustomize checks all the requirements (Git and Harness interoperatability) and is designed specifically to solve these concerns.  It is part of `kubectl` and does not introduce any additional tools or process.

## Consequences

DevOps maintainers will need to understand how Kustomize works; how the base and patch configuration combine and are used.

The way Kustomize implements many different patching techniques and the limitations to how the patching transformers work adds complexity that can be problematic for first time users.

See these PRs and docs as examples:

   * https://github.com/kubernetes-sigs/kustomize/issues/173
   * https://github.com/kubernetes-sigs/kustomize/issues/977
   * https://github.com/kubernetes-sigs/kustomize/blob/master/examples/inlinePatch.md

New users are recommended to familarize themselves will all the built-in patching mechanisms:

https://kubectl.docs.kubernetes.io/references/kustomize/builtins/

# Notes

   * https://www.densify.com/kubernetes-tools/kustomize
   * https://docs.harness.io/article/98u2hvzj0t-use-kustomize-for-kubernetes-deployments
   * https://kubectl.docs.kubernetes.io/
