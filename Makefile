
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
	docker run --rm -it -p 9000:8080 ${IMAGE}

localtest:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"resource": "/", "path": "/", "httpMethod": "GET", "requestContext": {}, "multiValueQueryStringParameters": null}'