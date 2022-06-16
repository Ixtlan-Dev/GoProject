.DEFAULT_GOAL:=help
SHELL:=/bin/bash

include local.env

.PHONY: help build rebuild start shell stop clean superuser migrations migrate

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build:  ## Builds the docker images
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build

rebuild:  ## Rebuilds the docker images
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build --no-cache

start: ## Starts the docker containers
	docker-compose up -d

# shell:  ## Opens the shell in api container
# 	docker-compose run --rm --entrypoint "/bin/bash" api

stop:  ## Stops the docker containers
	docker-compose down

clean: ## Removes the docker containers and images (including the volumes)
	docker-compose down --rmi all -v --remove-orphans
