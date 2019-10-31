FROM hashicorp/terraform:latest

RUN apk update && apk upgrade && apk add --no-cache \
    python \
    unzip \
    bash \
    curl \
    docker \
    && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip" \
    && unzip -d /tmp/ /tmp/awscli-bundle.zip \
    && /tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
    && rm -rf /var/cache/apk/*

COPY /packer_version.sh .
RUN "./packer_version.sh"

WORKDIR /usr/local/bin
ENTRYPOINT [""]
