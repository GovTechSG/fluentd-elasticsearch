# fluentd-elasticsearch

[![Anchore Image Overview](https://anchore.io/service/badges/image/03817ade40a05e4510dc552cdd42065fa7963d83241a97f7709a018fda5c3a11)](https://anchore.io/image/dockerhub/govtechsg%2Ffluentd-elasticsearch%3Alatest)

[![Build Status](https://travis-ci.org/GovTechSG/fluentd-elasticsearch.svg?branch=master)](https://travis-ci.org/GovTechSG/fluentd-elasticsearch)

This repository is an automated build job for a docker image containing fluentd service with a elasticsearch plugin installed and ready to use as an *output_plugin*.


## Plugins Available

- fluent-plugin-elasticsearch [uken/fluent-plugin-elasticsearch](https://github.com/uken/fluent-plugin-elasticsearch)
- fluent-plugin-aws-elasticsearch-service [atomita/fluent-plugin-aws-elasticsearch-service](https://github.com/atomita/fluent-plugin-aws-elasticsearch-service)

## Descriptions

### `latest`

Basically [fluentd-plugin-elasticsearch](#fluent-plugin-elasticsearch)

### `fluent-plugin-elasticsearch`

Canonical Tag: `fluentd-<FLUENTD-VERSION>_fluent-plugin-elasticsearch-<PLUGIN_VERSION>`

Latest URL: `fluentd-<FLUENTD-VERSION>_fluent-plugin-elasticsearch-latest`

#### Notes

Use this if elasticsearch is a self-hosted instance

### `fluent-plugin-aws-elasticsearch-service`

Canonical Tag: `fluentd-<FLUENTD-VERSION>_fluent-plugin-aws-elasticsearch-service-<PLUGIN_VERSION>`

Latest URL: `fluentd-<FLUENTD-VERSION>_fluent-plugin-aws-elasticsearch-service-latest`

#### Notes

Use this if using aws elasticsearch


## Usage

#### Running
> docker run -v ${PWD}/fluent.conf:/fluentd/etc/fluent.conf -p 24224:24224 -it govtechsg/fluentd-elasticsearch:latest


#### Available commands in container

Outputs fluentd and plugin versions

> version-info

## License

Available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
