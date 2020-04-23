FROM python:3.8-alpine

LABEL maintainer="Hans Mayer <hans.mayer83@gmail.com>"

RUN apk update && apk upgrade && apk add --no-cache --update \
    g++ \
    unzip \
    bash \
    curl \
    docker \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    ansible \
    ansible-lint \
    && rm -rf /var/cache/apk/*

COPY /*.sh ./
RUN "./packer_version.sh" && \
    "./terraform_version.sh" && \
    "./awscli_version.sh" && \
    "./clear_tmp.sh"

RUN pip3 install terraform-compliance

WORKDIR /usr/local/bin
ENTRYPOINT []
