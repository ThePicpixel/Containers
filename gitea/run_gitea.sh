#!/usr/bin/env bash
podman run -d --name=gitea -p 2222:22 -p 8080:3000 -v /var/lib/gitea:/data kapdap/gitea-rpi
