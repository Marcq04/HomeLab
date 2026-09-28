#!/bin/bash

CONTAINER_NAME="nginx-proxy-manager"

# Get status of the container
STATUS=$(docker inspect -f '{{.State.Status}}' "$CONTAINER_NAME" 2>/dev/null)

if [ "$STATUS" == "running" ]; then
    echo "[OK] $CONTAINER_NAME is healthy and running."
else
    echo "[WARNING] $CONTAINER_NAME is $STATUS. Restarting container..."
    docker restart "$CONTAINER_NAME"
fi
