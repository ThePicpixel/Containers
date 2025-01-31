#!/bin/sh

# Creates a pod named opendistro for our deployement
echo "[*] Creating pod opendistro..."
podman pod create --name opendistro --publish 5601:5601 --publish 9200:9200 --publish 5140:5140

# Deploys our elastic search container
echo "[*] Running opendistro.elastic into pod opendistro"
podman run --pod opendistro --name opendistro.elastic -d -e "discovery.type=single-node" amazon/opendistro-for-elasticsearch

# Deploys our kibana container
echo "[*] Running opendistro.kibana into pod opendistro"
podman run --pod opendistro --name opendistro.kibana -d -e "ELASTICSEARCH_URL=https://localhost:9200" -e "ELASTICSEARCH_HOSTS=https://localhost:9200" amazon/opendistro-for-elasticsearch-kibana
