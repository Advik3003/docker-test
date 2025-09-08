#!/bin/bash
set -e

APP_NAME="springboot-java21"
APP_VERSION="v1"
K8S_DIR="k8s"

echo "🚀 Step 1: Building Docker image..."
docker build -t $APP_NAME:$APP_VERSION .

echo "✅ Image built: $APP_NAME:$APP_VERSION"
echo

echo "🚀 Step 2: Applying Kubernetes manifests..."
kubectl apply -f $K8S_DIR/

echo "✅ Manifests applied."
echo

echo "🚀 Step 3: Checking Pods..."
kubectl get pods

echo "🚀 Step 4: Checking Services..."
kubectl get svc

echo
echo "👉 If service type is LoadBalancer, open: http://localhost:8080"
echo "👉 If service type is NodePort, check the PORT from above (e.g., 31340) and open: http://localhost:<PORT>"
