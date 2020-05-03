#!/bin/sh
cat << EOF
version: "3"

networks:
  traefik_default:
    external: true

services:
  $CI_PROJECT_NAME:
    image: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
    container_name: $APP_DEPLOY_NAME
    restart: always
    labels:
      - "traefik.http.routers.$APP_DEPLOY_NAME.rule=Host(\`$APP_DEPLOY_URL\`)"
      - "traefik.http.routers.$APP_DEPLOY_NAME.entrypoints=websecure"
      - "traefik.http.routers.$APP_DEPLOY_NAME.tls=true"
      - "traefik.http.routers.$APP_DEPLOY_NAME.tls.certresolver=leresolver"
      - "traefik.http.services.$APP_DEPLOY_NAME.loadbalancer.server.port=$APP_PORT"
    networks:
      - traefik_default
EOF
