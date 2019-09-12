IMAGE_URL=govtechsg/fluentd-elasticsearch
TEST_ARGS=test --image $(IMAGE_URL):latest --config ./test.yaml
TIMESTAMP=$$(date +%Y%m%d)

build:
	docker build --tag $(IMAGE_URL):latest .

version: build
	mkdir -p ./.version
	docker run --entrypoint version-info $(IMAGE_URL):latest | grep 'fluentd' | cut -f 2 -d ':' > ./.version/fluentd.version
	docker run --entrypoint version-info $(IMAGE_URL):latest | grep 'fluent-' > ./.version/plugins.version
	echo 'latest' > ./.version/dockertags
	echo "$(TIMESTAMP)" >> ./.version/dockertags
	echo "$$(cat ./.version/fluentd.version)" >> ./.version/dockertags
	echo "$$(cat ./.version/fluentd.version)-$$(cat ./.version/plugins.version)" >> ./.version/dockertags

publish: version
	cat ./.version/dockertags | xargs -I@ bash -c "docker tag $(IMAGE_URL):latest $(IMAGE_URL):@ && docker push $(IMAGE_URL):@"

test:
	container-structure-test $(TEST_ARGS)

test.docker: build
	docker run \
		--volume "$$(pwd)/test.yaml:/test.yaml" \
		--volume "/var/run/docker.sock:/var/run/docker.sock" \
		--workdir / \
		gcr.io/gcp-runtimes/container-structure-test \
		$(TEST_ARGS)

dev:
	docker-compose up -V
