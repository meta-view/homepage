#!/bin/sh
cat << EOF
version: "3"

networks:
  traefik_default:
    external: true

services:
  $CI_PROJECT_NAME:
    image: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
    container_name: $CI_PROJECT_PATH_SLUG-$CI_COMMIT_REF_SLUG
    restart: always
    labels:
      - "traefik.http.routers.$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG.rule=Host(\`$APP_DEPLOY_URL\`)"
      - "traefik.http.routers.$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG.entrypoints=websecure"
      - "traefik.http.routers.$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG.tls=true"
      - "traefik.http.routers.$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG.tls.certresolver=leresolver"
      - "traefik.http.services.$CI_PROJECT_NAME-$CI_COMMIT_REF_SLUG.loadbalancer.server.port=$APP_PORT"
    networks:
      - traefik_default
EOF
