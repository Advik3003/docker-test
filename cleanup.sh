#!/bin/bash
set -e

echo "🛑 Cleaning up Kubernetes resources..."
kubectl delete -f k8s/ || true

echo "🛑 Stopping Docker Compose (if running)..."
docker-compose down || true

echo "🧹 Pruning unused Docker stuff..."
docker system prune -af --volumes

echo "✅ Cleanup done."


