#! /bin/bash

# retrive awscli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "/tmp/awscli-bundle.zip"
unzip -d /tmp/ /tmp/awscli-bundle.zip
/tmp/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
