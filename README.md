# terra-packer

A simple docker container including terraform, packer and aws-cli

[![Build Status](https://api.travis-ci.org/pfandie/terra-packer.svg?branch=master)](https://travis-ci.org/pfandie/terra-packer)
[![Docker Build](https://img.shields.io/docker/v/pfandie/terra-packer?label=docker)](https://hub.docker.com/r/pfandie/terra-packer)
[![licencse](https://img.shields.io/github/license/pfandie/terra-packer)](https://hub.docker.com/r/pfandie/terra-packer)

## Feature tools

* [Ansible](https://docs.ansible.com)
* [AWS cli](https://docs.aws.amazon.com/cli/index.html)
* [Packer](https://www.packer.io)
* [Shellcheck](https://github.com/koalaman/shellcheck)
* [Terraform](https://www.terraform.io)
* [terraform-compliance](https://github.com/terraform-compliance/cli)
* [TFLint](https://github.com/terraform-linters/tflint)
* [tfsec](https://github.com/aquasecurity/tfsec)

## Usage

This container helps in e.g. GitLab-CI Omnibus installation.\
It could be used to help you creating AMI with GitLab-CI.

*run on local*:

```bash
# ansible:
docker run --rm pfandie/terra-packer ansible --version
# awscli:
docker run --rm pfandie/terra-packer aws -version
# packer:
docker run --rm pfandie/terra-packer packer -v
# shellcheck:
docker run --rm pfandie/terra-packer shellcheck -V
# terraform:
docker run --rm pfandie/terra-packer terraform -v
# tflint:
docker run --rm pfandie/terra-packer tflint -v
# tfsec:
docker run --rm pfandie/terra-packer tfsec -v
```

## Example

Just extend your .gitlab-ci.yml to make use of this Image

```bash
build_task:
  stage: build
  image: REPOSITORY-URL/terra-packer:latest
  only:
    refs:
      - master
  script:
    - ansible --version
    - ansible-lint --version
    - aws --version
    - packer -v
    - terraform -v
    - terraform-compliance --version
```
