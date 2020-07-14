DOCKER_REGISTRY ?= zebradil
DOCKER_IMAGE ?= taskd

build:
	docker build -t $(DOCKER_REGISTRY)/$(DOCKER_IMAGE):latest .
