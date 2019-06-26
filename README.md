# Dockerized Github Changelog Generator
[![Build Status](https://travis-ci.org/ferrarimarco/docker-github-changelog-generator.svg?branch=master)](https://travis-ci.org/ferrarimarco/docker-github-changelog-generator) ![Docker Stars](https://img.shields.io/docker/stars/ferrarimarco/github-changelog-generator.svg) [![Docker Pulls](https://img.shields.io/docker/pulls/ferrarimarco/github-changelog-generator.svg)](https://hub.docker.com/r/ferrarimarco/github-changelog-generator/) [![Docker Automated build](https://img.shields.io/docker/automated/ferrarimarco/github-changelog-generator.svg)](https://hub.docker.com/r/ferrarimarco/github-changelog-generator/) ![Docker Build Status](https://img.shields.io/docker/build/ferrarimarco/github-changelog-generator.svg)

This is a official containerization of [Github Changelog Generator](https://github.com/skywinder/github-changelog-generator).

For each Github Changelog Generator release, you will find the corresponding docker image tag.

# How to Run this Image


```
$ docker run -it --rm -v "$(pwd)":/usr/local/src/your-app ferrarimarco/github-changelog-generator
```
