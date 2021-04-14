# Dockerized Github Changelog Generator

![main workflow](https://github.com/github-changelog-generator/docker-github-changelog-generator/actions/workflows/main.yml/badge.svg)
![tag workflow](https://github.com/github-changelog-generator/docker-github-changelog-generator/actions/workflows/push-tagged-image.yml/badge.svg)

This is an official containerization of [Github Changelog Generator](https://github.com/github-changelog-generator/github-changelog-generator).

For each Github Changelog Generator release, you will find the corresponding docker image tag.

## How to Run this Image

```shell
docker run -it --rm -v "$(pwd)":/usr/local/src/your-app githubchangeloggenerator/github-changelog-generator
```
