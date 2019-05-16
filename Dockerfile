ARG BASE_IMAGE_TAG=stable-debian
FROM fluent/fluentd:${BASE_IMAGE_TAG}
LABEL Ryanoolala <ryan_goh@tech.gov.sg>
WORKDIR /home/fluent
# ENV PATH /home/fluent/.gem/ruby/2.4.0/bin:$PATH
ENV APT_INS="make libcurl4-gnutls-dev"
ENV APT_DEL="make libcurl4-gnutls-dev"
ARG GEM_NAME="fluent-plugin-elasticsearch fluent-plugin-aws-elasticsearch-service"

USER root
RUN apt-get update && \
      apt-get install -y ${APT_INS} && \
      gem install ${GEM_NAME} && \
      gem sources --clear-all && \
      apt-get remove -y ${APT_DEL}

USER fluent
COPY ./scripts/version-info /usr/bin
EXPOSE 24224

ENTRYPOINT exec fluentd -c /fluentd/etc/fluent.conf -p /fluentd/plugins
