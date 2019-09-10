IMAGE_URL=govtechsg/fluentd-elasticsearch
TIMESTAMP=$$(date +%Y%m%d)

build:
	docker build --tag $(IMAGE_URL):latest .

version: build
	mkdir -p ./.version
	docker run --entrypoint version-info $(IMAGE_URL):latest | grep fluentd | cut -f 2 -d ':' > ./.version/fluentd.version
	docker run --entrypoint version-info $(IMAGE_URL):latest | grep fluent- | tr -s '\n' '_' > ./.version/plugins.version
	echo 'latest' > ./.version/dockertags
	echo "$(TIMESTAMP)" >> ./.version/dockertags
	echo "$$(cat ./.version/fluentd.version)" >> ./.version/dockertags
	echo "$$(cat ./.version/fluentd.version)-$$(cat ./.version/plugins.version)" >> ./.version/dockertags

publish: version
	cat ./.version/dockertags | xargs -I@ bash -c "docker tag $(IMAGE_URL):latest $(IMAGE_URL):@ && docker push $(IMAGE_URL):@"

dev:
	docker-compose up -V
