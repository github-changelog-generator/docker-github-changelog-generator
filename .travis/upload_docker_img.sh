#!/bin/bash
. .travis/utils.sh
VERSION=$( get_version )
docker_push $VERSION ${PLAT}
