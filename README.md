# fluentd-elasticsearch

[![Build Status](https://travis-ci.org/GovTechSG/fluentd-elasticsearch.svg?branch=master)](https://travis-ci.org/GovTechSG/fluentd-elasticsearch)

This repository is an automated build job for a docker image containing fluentd service with a elasticsearch plugin installed and ready to use as an *output_plugin*.

- - -

# Plugins Available

The following plugins are available for this image:

- ElasticSearch [`uken/fluent-plugin-elasticsearch`](https://github.com/uken/fluent-plugin-elasticsearch)
- ElasticSearch (AWS) [`atomita/fluent-plugin-aws-elasticsearch-service`](https://github.com/atomita/fluent-plugin-aws-elasticsearch-service)
- Prometheus [`fluent/fluent-plugin-prometheus`](https://github.com/fluent/fluent-plugin-prometheus)

- - -

# Tag Descriptions

## `latest`

Basically [fluentd-plugin-elasticsearch](#fluent-plugin-elasticsearch)

## `x.y.z`

The semver version of the FluentD installed

## `$DATETIME`

Daily build of the image

## `x.y.z-service-X.Y.Z_service-Y.Z.X`

Full tag with all versions of relevant installed software.

- - -

# Usage

## Running

> docker run -v ${PWD}/fluent.conf:/fluentd/etc/fluent.conf -p 24224:24224 -it govtechsg/fluentd-elasticsearch:latest

## Environment variables

### For AWS ElasticSearch

To activate this, see the file at [`./config/fluent/default.conf`](./config/fluent/default.conf) and uncomment the section that indicates it's for an AWS ElasticSearch service in the `match *.**` codeblock.

| Key | Description |
| --- | --- |
| `LOGSTASH_PREFIX` | The prefix to use for the log entry |
| `AWS_ACCESS_KEY` | Access key to access the cluster |
| `AWS_SECRET_KEY` | Secret key to access the cluster |
| `AWS_ES_ENDPOINT` | The AWS ElasticSearch cluster endpoint URL |

### For Self-Hosted ElasticSearch

To activate this, see the file at [`./config/fluent/default.conf`](./config/fluent/default.conf) and uncomment the section that indicates it's for a self-hosted ElasticSearch service in the `match *.**` codeblock.

| Key | Description |
| --- | --- |
| `LOGSTASH_PREFIX` | The prefix to use for the log entry |
| `ELASTIC_HOST` | Hostname of the ElasticSearch service|
| `ELASTIC_PASSWORD` | Password of the ElasticSearch user |
| `ELASTIC_USER` | Username of the ElasticSearch user |

## Available debug commands in container

Outputs fluentd and plugin versions

> version-info

- - -

# Runbook

## Building the image

To build the image:

```sh
make build;
```

## Testing the image

You will need [`container-structure-test`](https://github.com/GoogleContainerTools/container-structure-test) to run the tests:

```sh
make test;
```

To run this in a Docker container without installing the `container-structure-test`, use:

```sh
make test.docker;
```

## Versioning the image

To retrieve the versioning details, use:

```sh
make version;
```

## Publishing the image

```sh
make publish;
```

## CI/CD environment variables

| Key | Description |
| --- | --- |
| `DH_USERNAME` | Username for DockerHub |
| `DH_PASSWORD` | Password for DockerHub |

- - -

# License

Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
