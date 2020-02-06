#!/bin/bash
# Based on https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/

echo "Kubernetes cluster info:"
kubectl cluster-info

echo "Setting up ingress on the cluster $(kubectl config current-context)..."
git clone https://github.com/nginxinc/kubernetes-ingress/
git checkout v1.6.1
cd kubernetes-ingress/deployments

# Configure RBAC
kubectl apply -f common/ns-and-sa.yaml
kubectl apply -f rbac/rbac.yaml

# Create Default secret, customization ConfigMap and Custom Resource Definitions
kubectl apply -f common/default-server-secret.yaml
kubectl apply -f common/nginx-config.yaml
kubectl apply -f common/custom-resource-definitions.yaml

# Run ingress controller
kubectl apply -f deployment/nginx-ingress.yaml
kubectl get pods --namespace=nginx-ingress

# Create GCP Load Balancer
kubectl apply -f service/loadbalancer.yaml

rm -rf ../../kubernetes-ingress

