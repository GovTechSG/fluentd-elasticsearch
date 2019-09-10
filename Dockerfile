ARG BASE_IMAGE_TAG=edge
FROM fluent/fluentd:${BASE_IMAGE_TAG}
ENV DEPS="build-base make" \
  DEPS_RM="build-base make " \
  GEM_NAME="fluent-plugin-elasticsearch fluent-plugin-aws-elasticsearch-service fluent-plugin-prometheus"
# this is required for `apk` commands to run successfully
USER root
RUN apk update --no-cache \
  && apk upgrade --no-cache
RUN apk add --no-cache ${DEPS} \
  && gem install ${GEM_NAME} \
  && gem sources --clear-all \
  && apk del --no-cache ${DEPS}
# switching back to fluent here before anyone nags
USER fluent
# we use the output of this script for populating the tags
COPY ./scripts/version-info /usr/bin
# other non-impact documentation stuff
WORKDIR /
EXPOSE 24224 24231
VOLUME [ "/fluentd/etc", "/fluentd/log", "/fluentd/plugins" ]
ENTRYPOINT [ "fluentd", "-c", "/fluentd/etc/fluent.conf" ]
LABEL maintainer "Ryanoolala <ryan_goh@tech.gov.sg>" \
  aside "zephinzer <joseph_goh@tech.gov.sg>"
