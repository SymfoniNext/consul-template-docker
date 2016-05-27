FROM alpine:3.3

ENV CONSUL_TEMPLATE_VERSION 0.14.0
LABEL name="consul-template" version="${CONSUL_TEMPLATE_VERSION}"

RUN apk add --no-cache curl && \
    cd / && \
    curl -Ls https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip > consul.zip && \
    unzip -x consul.zip -d bin && \
    rm consul.zip

ENTRYPOINT ["consul-template"]
