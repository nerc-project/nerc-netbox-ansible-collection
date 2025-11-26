#!/bin/bash
set -e

_PODMAN_RUN="sudo podman run --security-opt label=disable --rm -v $PWD:/code -w /code"

GALAXY_EXTRA_FILE=galaxy-requirements-extra.yml

if [ -f "$PWD/$GALAXY_EXTRA_FILE" ]
then
  export GALAXY_INSTALL="ansible-galaxy collection install \
          -r /code/$GALAXY_EXTRA_FILE"
  echo "Found $GALAXY_EXTRA_FILE will load addtional modules"
else
  export GALAXY_INSTALL='echo "No additional galaxy collecions specified"'
fi

echo ">> Working directory: ${PWD}"
