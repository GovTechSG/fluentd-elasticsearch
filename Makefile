IMAGE_URL=govtechsg/fluentd-elasticsearch

build:
	docker build --tag $(IMAGE_URL):latest .

dev:
	docker-compose up -V
