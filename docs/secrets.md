# ICS Secrets 

List of secrets that need to be stored securely and injected into Kubernetes clusters.

| Secret | Description | K8S Non-Production Namespaces | K8S Production Namespaces |
| --- | --- | --- | --- |
| acr-secret | Service Principle for ACR Pull Images| ics-dev, ics-intg, ics-stg | ics-prod, ics-as, ics-demo |
| tcmis-db-secret | TCMIS_OPS secret for ICS | ics-dev, ics-intg, ics-stg | ics-prod, ics-as, ics-demo |
