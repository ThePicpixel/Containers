#!/usr/bin/env bash

# Creates a pod named gitea for our deployement
echo "[*] Creating pod gitea..."
podman pod create --name gitea --publish 3000:3000

# Deploys our postgres container
echo "[*] Running postgres into pod gitea"
podman run -d --pod gitea --name postgres  -e POSTGRES_USER=gitea -e POSTGRES_PASSWORD=gitea -e POSTGRES_DB=giteadb postgres

# Deploys our gitea container
echo "[*] Running gitea into pod gitea"
podman run -d --pod gitea --name git gitea_arm

