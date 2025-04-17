#! /bin/sh

# Install dashboard with k8s-dashboard.yml
# Create users with dashboard-adminuser.yaml
# kubectl proxy
# get token with this script
# login at: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

kubectl -n ics-devops create token admin-user
