#!/usr/bin/env bash

if docker compose version > /dev/null 2>&1; then
  DOCKER_COMPOSE="docker compose"
else
  DOCKER_COMPOSE="docker-compose"
fi

if [ "$1" == "--no-dev" ]; then
  ${DOCKER_COMPOSE} -file ./compose/compose.yaml -file ./compose/compose.healthcheck.yaml "${@:2}"
else
  ${DOCKER_COMPOSE} -f  ./compose/compose.yml -f ./compose/compose.healthcheck.yaml "$@"
fi