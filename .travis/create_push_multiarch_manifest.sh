#!/bin/bash
. .travis/utils.sh

VERSION=$( get_version )

create_multiarch_manifest $VERSION "latest"
docker_push

create_multiarch_manifest $VERSION
docker_push $VERSION
