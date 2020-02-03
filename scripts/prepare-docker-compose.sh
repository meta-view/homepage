#!/bin/sh
cat << EOF
version: "3"

networks:
  proxy:
    external: true
  internal:
    external: false

services:
  $CI_PROJECT_NAME:
    image: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
    container_name: $CI_PROJECT_PATH_SLUG-$CI_COMMIT_REF_SLUG
    restart: always    
    labels:
      - traefik.backend=$CI_PROJECT_PATH_SLUG-$CI_COMMIT_REF_SLUG
      - traefik.frontend.rule=Host:$APP_DEPLOY_URL
      - traefik.docker.network=proxy
      - traefik.port=$APP_PORT
    networks:
      - internal
      - proxy
EOF
