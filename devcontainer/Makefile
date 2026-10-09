IMAGE_NAME = ephemia-dev
CONTAINER_NAME = ephemia 

# --- Host Directory Placeholders ---
#HOST_CLAUDE_DIR = $(HOME)/.claude
# the path on the host that has the source code you wan to mount in the container
HOST_CUSTOM_GIT_PATH = $(HOME)/git
# the path on the host that has a share dir that you might want to mount in the container
HOST_CUSTOM_SHARE_PATH = $(HOME)/share


# The :Z flag ensures SELinux context is handled correctly if applicable
VOLUMES = -v "$(HOST_CUSTOM_GIT_PATH):/work/git/:Z" \
          -v "$(HOST_CUSTOM_SHARE_PATH):/work/share/:Z"


# Local LAN Proxy Configuration ---
PROXY_URL = http://192.168.0.225:8888

PROXY_FLAGS = -e http_proxy=$(PROXY_URL) \
              -e https_proxy=$(PROXY_URL) \
              -e HTTP_PROXY=$(PROXY_URL) \
              -e HTTPS_PROXY=$(PROXY_URL)

# Default to 1 (use proxy) unless specified otherwise
USE_PROXY ?= 1

ifeq ($(USE_PROXY), 1)
    ACTIVE_PROXY_FLAGS = $(PROXY_FLAGS)
else
    ACTIVE_PROXY_FLAGS = 
endif

# --userns=keep-id ensures file ownership matches the ones from the host machine
RUN_FLAGS = --userns=keep-id $(VOLUMES) $(ACTIVE_PROXY_FLAGS)

.DEFAULT_GOAL := help
.PHONY: help build rebuild up start stop restart rm attach run

help: ## Show this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Builds the image from the Dockerfile
	podman build -t $(IMAGE_NAME) .

rebuild: ## Forces a complete rebuild without using cached layers
	podman build --no-cache -t $(IMAGE_NAME) .

up: ## Creates and starts the persistent background container (Use USE_PROXY=0 to disable the proxy)
	podman run -d -it --name $(CONTAINER_NAME) $(RUN_FLAGS) $(IMAGE_NAME) zsh

start: ## Starts an existing, stopped background container
	podman start $(CONTAINER_NAME)

stop: ## Stops the running background container
	podman stop $(CONTAINER_NAME)

restart: stop start ## Restarts the background container

rm: stop ## Stops and removes the background container completely
	podman rm $(CONTAINER_NAME)

attach: ## Drops you into an interactive shell inside the background container
	podman exec -it $(CONTAINER_NAME) zsh

run: ## Launches a quick, ephemeral container that deletes itself upon exit
	podman run --rm -it $(RUN_FLAGS) $(IMAGE_NAME) zsh
