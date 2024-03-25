FROM python:3.11.0-alpine3.15
# FROM ubuntu

LABEL maintainer="Hans Mayer <hans.mayer83@gmail.com>"

RUN apk update && apk upgrade && apk add --no-cache --update \
    ansible \
    bash \
    curl \
    docker \
    g++ \
    go \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    openssh-client \
    rsync \
    shellcheck \
    sudo \
    tar \
    unzip \
    && rm -rf /var/cache/apk/*

COPY *.sh ./

RUN ./packer_version.sh && \
    ./terraform_version.sh && \
    ./awscli_version.sh

RUN pip3 install terraform-compliance && \
    curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash && \
    go install github.com/aquasecurity/tfsec/cmd/tfsec@latest

RUN rm -rf /tmp/*

WORKDIR /usr/local/bin
CMD ["/bin/bash"]
