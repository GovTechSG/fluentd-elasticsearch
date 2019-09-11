# fluentd-elasticsearch

[![Build Status](https://travis-ci.org/GovTechSG/fluentd-elasticsearch.svg?branch=master)](https://travis-ci.org/GovTechSG/fluentd-elasticsearch)

This repository is an automated build job for a docker image containing fluentd service with a elasticsearch plugin installed and ready to use as an *output_plugin*.


## Plugins Available

The following plugins are available for this image:

- ElasticSearch [`uken/fluent-plugin-elasticsearch`](https://github.com/uken/fluent-plugin-elasticsearch)
- ElasticSearch (AWS) [`atomita/fluent-plugin-aws-elasticsearch-service`](https://github.com/atomita/fluent-plugin-aws-elasticsearch-service)
- Prometheus [`fluent/fluent-plugin-prometheus`](https://github.com/fluent/fluent-plugin-prometheus)

## Tag Descriptions

### `latest`

Basically [fluentd-plugin-elasticsearch](#fluent-plugin-elasticsearch)

### `x.y.z`

The semver version of the FluentD installed

### `$DATETIME`

Daily build of the image

### `x.y.z-service-X.Y.Z_service-Y.Z.X`

Full tag with all versions of relevant installed software.

## Usage

### Running

> docker run -v ${PWD}/fluent.conf:/fluentd/etc/fluent.conf -p 24224:24224 -it govtechsg/fluentd-elasticsearch:latest

### Available commands in container

Outputs fluentd and plugin versions

> version-info

## Runbook

### Building the image

To build the image:

```sh
make build
```

### Publishing the image

```sh
make publish;
```

## License

Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
