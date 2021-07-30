#! /bin/bash

# retrive awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -d /tmp/ /tmp/awscliv2.zip

sudo /tmp/aws/install -i /usr/local/aws-cli -b /usr/local/bin
