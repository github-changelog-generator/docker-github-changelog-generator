#!/bin/bash
# Get the current release version
get_version() {
    version=$(cat Gemfile | grep github_changelog_generator | awk -F "'" '{print $4}')
    echo "$version"
}

# Build and test docker images
build_docker_image() {
    version=$( get_version )
    docker build -t ferrarimarco/github-changelog-generator:manifest-${PLAT}-${version} .
    docker run --rm -i ferrarimarco/github-changelog-generator:manifest-${PLAT}-${version}
}

# Function usages: upload docker image/manifest
# Syntax:
# docker_push <version> <arch>
# docker_push <version>
# docker_push
docker_push (){
    version=$1
    plat=$2
    image=""
    flag="manifest"

    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

    if [ ! -z "${plat}" ] && [ ! -z "${version}" ]; then
        image="ferrarimarco/github-changelog-generator:manifest-${plat}-${version}"
        flag=""
    elif [ ! -z "${version}" ]; then
        image="ferrarimarco/github-changelog-generator:manifest-${version}"
    else
        image="ferrarimarco/github-changelog-generator:manifest-latest"
    fi
    echo "docker ${flag} push ${image}"
    docker ${flag} push ${image}
    docker logout
}

# Function usages: create multiarch manifest
# Syntax:
# create_multiarch_manifest <latest>
# create_multiarch_manifest
create_multiarch_manifest(){
    # To enable manifest create feature
    export DOCKER_CLI_EXPERIMENTAL=enabled
    version="$1"
    multiarch_manifest=${2:-$version}
    docker manifest create \
        ferrarimarco/github-changelog-generator:manifest-${multiarch_manifest} \
        --amend ferrarimarco/github-changelog-generator:manifest-amd64-${version} \
        --amend ferrarimarco/github-changelog-generator:manifest-arm64-${version}
}
