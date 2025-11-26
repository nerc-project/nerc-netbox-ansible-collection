#!/bin/bash
set -e

source $PWD/ci-scripts/init.sh

${_PODMAN_RUN} \
  ghcr.io/nerc-project/nerc-ansible-container:sha-61be9eb \
    bash -l -c \
      ". /srv/docker-ansible/env/bin/activate;
      $GALAXY_INSTALL;
      ansible-lint $@"
