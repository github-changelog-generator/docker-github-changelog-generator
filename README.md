# Dockerized Github Changelog Generator

[![Build Status](https://github.com/github/docs/actions/workflows/main.yml/badge.svg)](https://travis-ci.com/github-changelog-generator/docker-github-changelog-generator)
![Docker Stars](https://img.shields.io/docker/stars/ferrarimarco/github-changelog-generator.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/ferrarimarco/github-changelog-generator.svg)](https://hub.docker.com/r/ferrarimarco/github-changelog-generator/)

This is an official containerization of [Github Changelog Generator](https://github.com/github-changelog-generator/github-changelog-generator).

For each Github Changelog Generator release, you will find the corresponding docker image tag.

## How to Run this Image

```shell
docker run -it --rm -v "$(pwd)":/usr/local/src/your-app ferrarimarco/github-changelog-generator
```
