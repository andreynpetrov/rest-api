
IMAGE := fastapi:latest

.PHONY: install install-test test build

install:
	pip install -r requirements.txt

install-test:
	pip install -r requirements-test.txt

test: install install-test
	pytest

build:
	docker build -t ${IMAGE} .

run: build
	docker run --rm -it -p 8080:80 ${IMAGE}