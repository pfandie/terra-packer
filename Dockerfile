FROM hashicorp/terraform:latest

RUN apk update && apk upgrade && apk add --no-cache \
    python \
    unzip \
    bash \
    curl \
    && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip" \
    && unzip -d /tmp/ /tmp/awscli-bundle.zip \
    && /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && curl "https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip" -o "/tmp/packer.zip" \
    && unzip -d /tmp/ /tmp/packer.zip \
    && mv /tmp/packer /usr/local/bin/packer \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

WORKDIR /usr/local/bin
ENTRYPOINT [""]
